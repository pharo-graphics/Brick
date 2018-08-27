Class {
	#name : #BrGlamorousTabGroupHeaderLook,
	#superclass : #BrTabGroupHeaderLook,
	#instVars : [
		'splitter'
	],
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousTabGroupHeaderLook >> initialize [
	super initialize.
	
	self headerDo: [ :anElement | anElement look: BrLayoutLook linearHorizontal hMatchParent vFitContent ].
	self tabbarDo: [ :anElement | anElement look: BrLayoutLook linearHorizontal hMatchParent alignCenter ].
			"toolbar here is not a toolbar itself, it is a container for it, the actual toolbar is built using
			a stencil from BrTabModel"
	self toolbarDo: [ :anElement | anElement look: BrLayoutLook linearHorizontal fitContent alignCenter ].
	
	splitter := BlElement new.
	splitter background: Color veryVeryLightGray.
	splitter constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical exact: 1.
		c ignoreByLayout.
		c ignored vertical alignBottom ].

	self headerDo: [ :anElement | anElement addChild: splitter ]
]
