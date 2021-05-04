"
I am a tab switcher look that position tabs header at top-center part of container.
I am used by ${class:BrGlamorousTabGroupSwitcherLook}$ where you can find examples.

"
Class {
	#name : #BrGlamorousTabGroupSwitcherHeaderAptitude,
	#superclass : #BrTabGroupHeaderAptitude,
	#category : #'Brick-Glamorous-Tabs - Switcher'
}

{ #category : #initialization }
BrGlamorousTabGroupSwitcherHeaderAptitude >> initialize [
	super initialize.
	
	"Header should always fit content vertically, while horizontal resizing depends on a resizing strategy of the tab group
	We have the following structure:
	
	- header
		- scrollable
			- tabbar
	"
	
	self header addAptitude: BrGlamorousFocusableShadowAptitude.

	self addChangeProperty: #(header geometry) with: [ BlStadium new ].
	self addChangeProperty: #(header background) with: [ Color white ]. 
	self addChangeProperty: #(header layout) with: [ BlLinearLayout horizontal alignCenter ].
	
	self addChangeProperty: #(tabbar layout) with: [ 
		BlLinearLayout horizontal alignCenter cellSpacing: 0 ].

	self add: (BrLayoutResizerAptitude new
		anyToFitContent: self header).

	self header addAptitude: (BrLayoutResizerAptitude new
		anyToFitContent: self scrollTabbar).

	self scrollTabbar addAptitude: (BrLayoutResizerAptitude new
		anyToFitContent: self tabbar)
]
