"
I am an abstract class.
I am a tab switcher look.
My subclasses expect to be attached to ${class:BrTab}$ instances.

"
Class {
	#name : #BrGlamorousTabSwitcherLook,
	#superclass : #BrTabLook,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #initialization }
BrGlamorousTabSwitcherLook >> initialize [
	super initialize.

	self add: BrLayoutResizerLook new inherit.
	self add: (BrLayoutAlignmentLook forHorizontalLinearLayout).

	self addChangeProperty: #(widget padding) with: [ BlInsets top: 2 left: 2 bottom: 2 right: 2 ].

	self add: (BrStyleCommonLook new
		default: 	[ :aStyle | aStyle background: Color white ];
		hovered: [ :aStyle | aStyle background: Color veryVeryLightGray lighter ])
]
