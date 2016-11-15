updating
updateSelectionShapes
	| lineStream currentLine startPoint endPoint height highlightStartPosition highlightEndPosition interval extendEnd start end|
	"selectionShapes ifNotNil: [ ^ selectionShapes ]."
	
	selectionShapes do:#delete.
	selectionShapes removeAll.
	
	interval := widget editorModel selection. 
	
	interval minMaxDo: [ :min :max |
		start := (text layoutView layout startPosition max: min) min: text layoutView layout endPosition.
		extendEnd := text layoutView layout endPosition < max.
		end := (text layoutView layout startPosition max: max) min: text layoutView layout endPosition ].

	interval := start to: end.
	
	
	interval  isEmpty ifTrue: [ ^ selectionShapes ].
	
	

	highlightStartPosition := text layoutView layout positionAt: interval start ifOutside: [ ].
	highlightEndPosition := text layoutView layout positionAt: interval end ifOutside: [ ]. 
	
	self updateHighlightFontColorStart: widget editorModel selection start position
	 end: widget editorModel selection end position .
	
	
	height := 0.
	lineStream := text layoutView layout lines readStream.

	"Skip to line where highlight starts, caching the accumulated y offset for later"	
	[ (currentLine := lineStream next) = highlightStartPosition line ] whileFalse: [ height := height + currentLine height ].

	"The highlight of the first line of the interval will always start at... the start of the interval, duh"
	startPoint := highlightStartPosition topPoint.
	
	"The highlight of each line except the last ends at the right side of the view"
	[ currentLine == highlightEndPosition line ] whileFalse: [  
		endPoint := (text layoutView  width + self textOffset x) @ (height + currentLine height).
		selectionShapes add: (self createSelectionShapeStart: startPoint end: endPoint).
		
		height := height + currentLine height.
		currentLine := lineStream next.
		startPoint := 0@height.
	].

	"We're at the last line, end the highlight at the end of the interval"
	endPoint := extendEnd 
		ifTrue: [ (text layoutView width + self textOffset y) @ (height + currentLine height) ]
		ifFalse: [ highlightEndPosition bottomPoint ].
	
	selectionShapes add: (self createSelectionShapeStart: startPoint end: endPoint).
	textContainer addChildren: selectionShapes.
	
	^ selectionShapes.