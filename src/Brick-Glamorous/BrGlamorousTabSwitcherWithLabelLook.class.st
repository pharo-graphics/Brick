"
I am a tab switcher look with an icon.
I expect to be attached to ${class:BrTab}$.
See examples at ${class:BrGlamorousTabGroupSwitcherLook}$ and ${class:BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook}$.

"
Class {
	#name : #BrGlamorousTabSwitcherWithLabelLook,
	#superclass : #BrGlamorousTabSwitcherLook,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #initialization }
BrGlamorousTabSwitcherWithLabelLook >> initialize [
	super initialize.

	self add: (BrGlamorousTextLabelLook new foreground: Color black).	
	
]
