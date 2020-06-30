Class {
	#name : #BrGlamorousTabGroupSwitcherHeaderLook,
	#superclass : #BrTabGroupHeaderLook,
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousTabGroupSwitcherHeaderLook >> initialize [
	super initialize.
	
	"Header should always fit content vertically, while horizontal resizing depends on a resizing strategy of the tab group
	We have the following structure:
	
	- header
		- scrollable
			- tabbar
	"
	
	self addChangeProperty: #(header border) with: [ BlBorder paint: Color black width: 1 ].
	self addChangeProperty: #(header geometry) with: [ BlStadium new ].
	self addChangeProperty: #(header background) with: [ Color white ]. 
	self addChangeProperty: #(header layout) with: [ BlLinearLayout horizontal alignCenter ]. 
	
	self addChangeProperty: #(tabbar layout) with: [ BlLinearLayout horizontal ].

	self add: (BrLayoutResizerLook new
		anyToFitContent: self header;
		vAnyToFitContent: self scrollTabbar;
		hInherit: self scrollTabbar;
		anyToFitContent: self tabbar)
]

{ #category : #hooks }
BrGlamorousTabGroupSwitcherHeaderLook >> onTabDeselected: aBrTabModel [ 
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
BrGlamorousTabGroupSwitcherHeaderLook >> onTabSelected: aTabModel [
	| anAssoc |
	super onTabSelected: aTabModel.

	anAssoc := self tabs
		detect: [ :eachAssoc | eachAssoc key = aTabModel ]
		ifNone: [ self error: 'Tab model association must exist' ].
	
	aTabModel widgetDo: [ :aTabElement |
		anAssoc value: nil.
		self tabbar removeChild: aTabElement ]
]
