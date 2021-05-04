"
I am a tab switcher look that position tabs header at top-center part of container.
I hide a selected ${class:BrTab}$ header element.
I am used by ${class:BrGlamorousTabGroupSwitcherWithHiddenSelectedTabLook}$ where you can find examples.

"
Class {
	#name : #BrGlamorousTabGroupSwitcherHeaderWithHiddenSelectedTabAptitude,
	#superclass : #BrGlamorousTabGroupSwitcherHeaderAptitude,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #hooks }
BrGlamorousTabGroupSwitcherHeaderWithHiddenSelectedTabAptitude >> onTabDeselected: aBrTabModel [ 
	| anAssoc |
	super onTabDeselected: aBrTabModel.

	anAssoc := self tabs
		detect: [ :eachAssoc | eachAssoc key = aBrTabModel ]
		ifNone: [ self error: 'Tab model association must exist' ].

	aBrTabModel widgetDo: [ :aTabElement |
		self tabbar removeChildren: self tabElements.
		anAssoc value: aTabElement.
		self tabbar addChildren: self tabElements ].
]

{ #category : #hooks }
BrGlamorousTabGroupSwitcherHeaderWithHiddenSelectedTabAptitude >> onTabSelected: aTabModel [
	| anAssoc |
	super onTabSelected: aTabModel.

	anAssoc := self tabs
		detect: [ :eachAssoc | eachAssoc key = aTabModel ]
		ifNone: [ self error: 'Tab model association must exist' ].
	
	aTabModel widgetDo: [ :aTabElement |
		anAssoc value: nil.
		self tabbar removeChild: aTabElement ]
]
