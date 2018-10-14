Class {
	#name : #BrTextEditorLineSegmentTextPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
	#instVars : [
		'currentCursors'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'instance creation' }
BrTextEditorLineSegmentTextPiece >> createElement: anEditorElement [
	<return: #BlElement>

	^ (anEditorElement editor segmentBuilder wordStencilBuilder
		text: self text;
		editorElement: anEditorElement;
		segmentPiece: self) asElement
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentTextPiece >> globalTextIndexToLocal: aTextIndex [
	<return: #Number>

	^ self text isEmpty
		ifTrue: [ 0 ]
		ifFalse: [ aTextIndex - self start + 1 ]
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentTextPiece >> hasCursor: anEditorElement [
	<return: #Boolean>

	"^ currentCursor isNotNil and: [ currentCursor isVisible ]"
]

{ #category : #initialization }
BrTextEditorLineSegmentTextPiece >> initialize [
	super initialize.
	
	currentCursors := Set new
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentTextPiece >> updateCursor: aTextElement of: aLineSegment in: anEditorElement [
	| theCursorsInside |
	
	theCursorsInside := anEditorElement editor cursor allCursors
		select: [ :aCursor | aCursor insideSubText: self of: aLineSegment ].
	
	"tell to remove all existing cursors"
	currentCursors do: [ :aCursor |
		aTextElement dispatchEvent: (BrTextEditorHideCursorRequest new
				editorElement: anEditorElement;
				cursorPosition: aCursor position) ].

	"create a collection of new cursors in local coordinates"
	currentCursors := theCursorsInside collect: [ :aCursor |
		| aNewCursor |	
		aNewCursor := aCursor copy.
		aNewCursor position: (self globalTextIndexToLocal: aCursor position).
		aNewCursor ].

	"tell to add new cursors"
	currentCursors do: [ :aCursor |
		aTextElement dispatchEvent: (BrTextEditorShowCursorRequest new
				editorElement: anEditorElement;
				hasFocus: anEditorElement hasFocus;
				cursorPosition: aCursor position) ]
]

{ #category : #'selection - management' }
BrTextEditorLineSegmentTextPiece >> updateSelection: aTextElement of: aLineSegment in: anEditorElement [
	| aTextEditor |

	aTextEditor := anEditorElement editor.

	aTextElement dispatchEvent: (BrTextEditorDeselectRequest new
		editorElement: anEditorElement;
		fromIndex: 0;
		toIndex: self text size).

	(aTextEditor selection + aTextEditor selectionRecorder selection) do: [ :aSelection |
		| aSelectionInterval textInterval |
		aSelectionInterval := aSelection interval.
		textInterval := BlSelection from: self text start to: self text end.
		(aSelection overlaps: textInterval)
			ifTrue: [
				| localFrom localTo |
				localFrom := (aSelectionInterval first - self text start + 1) max: 0.
				localTo := (aSelectionInterval last - self text start + 1) min: self text size + 1.

				aTextElement dispatchEvent: (BrTextEditorSelectRequest new
					editorElement: anEditorElement;
					fromIndex: localFrom;
					toIndex: localTo) ] ]
]
