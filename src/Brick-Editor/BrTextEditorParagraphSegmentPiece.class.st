Class {
	#name : #BrTextEditorParagraphSegmentPiece,
	#superclass : #Object,
	#traits : 'TBrTextEditorTextualPiece',
	#classTraits : 'TBrTextEditorTextualPiece classTrait',
	#instVars : [
		'segment'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Paragraph'
}

{ #category : #'instance creation' }
BrTextEditorParagraphSegmentPiece >> createElement: anEditorElement [
	<return: #BlElement>

	^ self subclassResponsibility
]

{ #category : #printing }
BrTextEditorParagraphSegmentPiece >> gtDisplayOn: aStream [
	self printOn: aStream
]

{ #category : #testing }
BrTextEditorParagraphSegmentPiece >> isText [
	^ false
]

{ #category : #updating }
BrTextEditorParagraphSegmentPiece >> onRecycled: aPieceElement in: anEditorElement [
]

{ #category : #printing }
BrTextEditorParagraphSegmentPiece >> printOn: aStream [
	self text printOn: aStream
]

{ #category : #accessing }
BrTextEditorParagraphSegmentPiece >> segment [
	^ segment
]

{ #category : #accessing }
BrTextEditorParagraphSegmentPiece >> segment: anObject [
	segment := anObject
]

{ #category : #updating }
BrTextEditorParagraphSegmentPiece >> updateFocus: hasFocus of: aTextPieceElement in: anEditorElement [
	| aRequest |

	aRequest := hasFocus
		ifTrue: [ BrTextEditorFocusRequest new ]
		ifFalse: [ BrTextEditorBlurRequest new ].

	aTextPieceElement dispatchEvent: (aRequest editorElement: anEditorElement)
]

{ #category : #updating }
BrTextEditorParagraphSegmentPiece >> updateText: aTextElement of: aLineSegment in: anEditorElement [
	aTextElement dispatchEvent: (BrTextEditorTextChangedRequest new
		editorElement: anEditorElement;
		segmentPiece: self;
		text: self text;
		textStart: self textStart;
		textEnd: self textEnd)
]

{ #category : #'api - geometry' }
BrTextEditorParagraphSegmentPiece >> wordMargin [
	<return: #BlInsets>
	| aHalfOfLineSpacing |
	
	aHalfOfLineSpacing := (self segment lineSpacing / 2.0) floor.

	^ BlInsets
		top: aHalfOfLineSpacing
		bottom: (self segment lineSpacing - aHalfOfLineSpacing)
]

{ #category : #'api - geometry' }
BrTextEditorParagraphSegmentPiece >> wordPadding [
	<return: #BlInsets>
		
	^ self segment wordPadding
]
