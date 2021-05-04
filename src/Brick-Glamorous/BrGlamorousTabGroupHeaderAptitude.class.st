Class {
	#name : #BrGlamorousTabGroupHeaderAptitude,
	#superclass : #BrTabGroupHeaderWithToolbarAptitude,
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousTabGroupHeaderAptitude >> initialize [
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

	self add: (BrLayoutResizerAptitude new
		vAnyToFitContent: self header;
		hInherit: self header).

	self header addAptitude: (BrLayoutResizerAptitude new
		hAnyToMatchParent: self scrollTabbar;
		vAnyToFitContent: self scrollTabbar;
		anyToFitContent: self toolbar;
		anyToFitContent: self actionbar).

	self scrollTabbar addAptitude: (BrLayoutResizerAptitude new
		anyToFitContent: self tabbar).
]
