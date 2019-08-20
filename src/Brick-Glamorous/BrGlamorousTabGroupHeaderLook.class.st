Class {
	#name : #BrGlamorousTabGroupHeaderLook,
	#superclass : #BrTabGroupHeaderLook,
	#instVars : [
		'splitter'
	],
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #accessing }
BrGlamorousTabGroupHeaderLook >> gtTabsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Tabs';
		items: [ self tabs ];
		column: 'Model' do: [ :aColumn | 
			aColumn 
				item: [ :anAssoc | anAssoc key ];
				matchParent ]
]

{ #category : #initialization }
BrGlamorousTabGroupHeaderLook >> initialize [
	super initialize.
	
	"Header should always fit content vertically, while horizontal resizing depends on a resizing strategy of the tab group
	We have the following structure:
	
	- header
		- scrollable
			- tabbar
		- toolbar
		- splitter
	"

	self header layout: BlLinearLayout horizontal alignCenterLeft.
	self tabbar layout: BlLinearLayout horizontal.
	self toolbar layout: BlLinearLayout horizontal.

	self add: (BrLayoutResizerLook new
		vAnyToFitContent: self header;
		hInherit: self header;
		vAnyToFitContent: self scrollTabbar;
		hInherit: self scrollTabbar;
		anyToFitContent: self tabbar;
		anyToFitContent: self toolbar).

	splitter := BlElement new labeled: 'Splitter'.
	splitter background: Color veryVeryLightGray.
	splitter constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical exact: 1.
		c ignoreByLayout.
		c ignored vertical alignBottom ].

	self headerDo: [ :anElement | anElement addChild: splitter ]
]
