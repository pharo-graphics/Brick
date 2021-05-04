"
I am a tab switcher look with an icon.
I expect to be attached to ${class:BrTab}$.
See examples at ${class:BrGlamorousTabGroupSwitcherLook}$ and ${class:BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook}$.

"
Class {
	#name : #BrGlamorousTabSwitcherWithLabelAptitude,
	#superclass : #BrGlamorousTabSwitcherAptitude,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #initialization }
BrGlamorousTabSwitcherWithLabelAptitude >> initialize [
	super initialize.

	self add: (BrGlamorousTextLabelAptitude new foreground: Color black).	
	
]
