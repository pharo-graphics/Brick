Class {
	#name : #BrGlamorousSpaceTabLook,
	#superclass : #BrTabLook,
	#instVars : [
		'labelLook'
	],
	#category : #'Brick-Glamorous-Tabs - Space'
}

{ #category : #initialization }
BrGlamorousSpaceTabLook >> initialize [
	super initialize.

	self add: (BrGlamorousTextLabelLook new foreground: Color black).
	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).

	self add: (BrInteractiveCommonLook new
		default: [ :aWidget | aWidget padding: (BlInsets top: 8 left: 12 bottom: 8 right: 12) ];
		deselected: [ :aWidget | aWidget background: Color transparent ];
		hovered: [ :aWidget | aWidget background: (Color white alpha: 0.2) ];
		selected: [ :aWidget | aWidget background: Color white ])
]
