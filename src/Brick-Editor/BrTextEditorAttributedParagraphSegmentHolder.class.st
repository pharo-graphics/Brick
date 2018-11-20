Class {
	#name : #BrTextEditorAttributedParagraphSegmentHolder,
	#superclass : #BrTextEditorSegmentHolder,
	#instVars : [
		'segment'
	],
	#category : #'Brick-Editor-Model - Segment-Text-Line-Attributed'
}

{ #category : #initialization }
BrTextEditorAttributedParagraphSegmentHolder >> createSegmentElement [
	"Create and return an that should represent a segment that I will hold.
	An element can be any of `BlElement withAllSubclasses`"
	<return: #BlElement>
	
	^ BlElement new
		layout: BlLinearLayout vertical;
		background: Color veryVeryLightGray;
		geometry: (BlRectangle cornerRadius: 10);
		padding: (BlInsets top: 20 left: 8 bottom: 8 right: 8);
		focusability: BlFocusability after;
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ];
		yourself
]

{ #category : #accessing }
BrTextEditorAttributedParagraphSegmentHolder >> segment: anEditorSegment [
	| aSubEditor aSubEditorElement |
	segment := anEditorSegment.

	aSubEditor := BrTextEditor new text: (BrScopedText text: anEditorSegment text asString asRopedText). 
	
	aSubEditorElement := BrEditorElement new editor: aSubEditor.
	aSubEditorElement background: Color white.
	aSubEditorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical fitContent ].

	itemElement removeChildren.
	itemElement addChild: aSubEditorElement
]
