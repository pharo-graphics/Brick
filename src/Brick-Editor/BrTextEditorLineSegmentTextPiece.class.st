Class {
	#name : #BrTextEditorLineSegmentTextPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
	#instVars : [
		'currentCursor'
	],
	#category : 'Brick-Editor-Model - Segment-Text-Line'
}

{ #category : #'instance creation' }
BrTextEditorLineSegmentTextPiece >> createElement: anEditorElement [
	<return: #BlElement>

	^ (anEditorElement editor segmentBuilder wordStencilBuilder
		text: self text;
		editorElement: anEditorElement) asElement
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

	^ currentCursor isNotNil and: [ currentCursor isVisible ]
]

{ #category : #'api - cursor' }
BrTextEditorLineSegmentTextPiece >> updateCursor: aTextElement of: aLineSegment in: anEditorElement [
	| aCursor aCursorPosition hadCursor hasCursor oldCursor |
	
	aCursor := anEditorElement editor cursor.
	
	hadCursor := self hasCursor: anEditorElement.

	(aCursor insideSubText: self of: aLineSegment)
		ifFalse: [
			hadCursor
				ifTrue: [
					aTextElement dispatchEvent: (BrTextEditorHideCursorRequest new
						editorElement: anEditorElement;
						cursorPosition: currentCursor position).
					currentCursor := nil ].
			^ self ].

	oldCursor := currentCursor.
	hadCursor ifTrue: [
		aTextElement dispatchEvent: (BrTextEditorHideCursorRequest new
			editorElement: anEditorElement;
			cursorPosition: oldCursor position).
		currentCursor := nil ].

	currentCursor := aCursor copy.
	aCursorPosition := self globalTextIndexToLocal: aCursor position.
	currentCursor position: aCursorPosition.
	
	hasCursor := self hasCursor: anEditorElement.
	hasCursor
		ifTrue: [ aTextElement dispatchEvent: (BrTextEditorShowCursorRequest new
			editorElement: anEditorElement;
			hasFocus: anEditorElement hasFocus;
			cursorPosition: currentCursor position) ]
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
