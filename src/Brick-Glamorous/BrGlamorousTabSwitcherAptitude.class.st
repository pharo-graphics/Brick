"
I am an abstract class.
I am a tab switcher look.
My subclasses expect to be attached to ${class:BrTab}$ instances.

"
Class {
	#name : #BrGlamorousTabSwitcherAptitude,
	#superclass : #BrTabAptitude,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #initialization }
BrGlamorousTabSwitcherAptitude >> initialize [
	super initialize.

	self add: BrLayoutResizerAptitude new inherit.
	self add: (BrLayoutAlignmentAptitude forHorizontalLinearLayout).

	self addChangeProperty: #(widget padding) with: [ BlInsets top: 2 left: 2 bottom: 2 right: 2 ].

	self add: (BrStyleCommonAptitude new
		default: 	[ :aStyle | aStyle background: Color white ];
		hovered: [ :aStyle | aStyle background: Color veryVeryLightGray lighter ])
]
