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

	self add: BrShadowLook.
	
	"self addChangeProperty: #(widget geometry) with: [ BlRectangle cornerRadius: 8 ]."

	self header layout: BlLinearLayout horizontal alignCenterLeft.
	self tabbar layout: BlLinearLayout horizontal.

	self add: (BrLayoutResizerLook new
		vAnyToFitContent: self header;
		hInherit: self header;
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
