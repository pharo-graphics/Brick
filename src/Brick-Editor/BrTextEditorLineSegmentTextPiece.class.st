Class {
	#name : #BrTextEditorLineSegmentTextPiece,
	#superclass : #BrTextEditorLineSegmentPiece,
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

{ #category : #updating }
BrTextEditorLineSegmentTextPiece >> updateFocus: aBoolean of: aTextPieceElement in: anEditorElement [
	| aRequest |

	aRequest := aBoolean
		ifTrue: [ BrTextEditorFocusRequest new ]
		ifFalse: [ BrTextEditorBlurRequest new ].

	aTextPieceElement dispatchEvent: (aRequest editorElement: anEditorElement)
]

{ #category : #updating }
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

{ #category : #updating }
BrTextEditorLineSegmentTextPiece >> updateText: aTextElement of: aLineSegment in: anEditorElement [
	aTextElement dispatchEvent: (BrTextEditorTextChangedRequest new editorElement: anEditorElement)
]
