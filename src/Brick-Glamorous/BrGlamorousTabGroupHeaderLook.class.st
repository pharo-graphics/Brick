Class {
	#name : #BrGlamorousTabGroupHeaderLook,
	#superclass : #BrTabGroupHeaderWithToolbarLook,
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousTabGroupHeaderLook >> initialize [
	super initialize.
	
	"Header should always fit content vertically, while horizontal resizing depends on a resizing strategy of the tab group
	We have the following structure:
	
	- header
		- scrollable
			- tabbar
		- toolbar
		- actionbar
	"

	self header layout: BlLinearLayout horizontal alignCenterLeft.
	self tabbar layout: BlLinearLayout horizontal.
	self toolbar layout: BlLinearLayout horizontal.
	self actionbar layout: BlLinearLayout horizontal.

	self add: (BrLayoutResizerLook new
		vAnyToFitContent: self header;
		hInherit: self header;
		vAnyToFitContent: self scrollTabbar;
		hInherit: self scrollTabbar;
		anyToFitContent: self tabbar;
		anyToFitContent: self toolbar;
		anyToFitContent: self actionbar)
]
