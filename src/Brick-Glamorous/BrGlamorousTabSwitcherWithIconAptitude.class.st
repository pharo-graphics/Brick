"
I am a tab switcher look with a label.
I expect to be attached to ${class:BrTab}$.
See examples at ${class:BrGlamorousTabGroupSwitcherLook}$ and ${class:BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook}$.

"
Class {
	#name : #BrGlamorousTabSwitcherWithIconAptitude,
	#superclass : #BrGlamorousTabSwitcherAptitude,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #initialization }
BrGlamorousTabSwitcherWithIconAptitude >> initialize [
	super initialize.

	self add: (BrGlamorousButtonIconAptitude new).
	
	self addChangeProperty: #(widget geometry) with: [ BlCircle new ].
]
