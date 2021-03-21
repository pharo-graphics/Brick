"
I am a tab switcher look with a label.
I expect to be attached to ${class:BrTab}$.
See examples at ${class:BrGlamorousTabGroupSwitcherLook}$ and ${class:BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook}$.

"
Class {
	#name : #BrGlamorousTabSwitcherWithIconLook,
	#superclass : #BrGlamorousTabSwitcherLook,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #initialization }
BrGlamorousTabSwitcherWithIconLook >> initialize [
	super initialize.

	self add: (BrGlamorousButtonIconLook new).
	
	self addChangeProperty: #(widget geometry) with: [ BlCircle new ].
]
