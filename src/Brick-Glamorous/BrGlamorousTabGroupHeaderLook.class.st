Class {
	#name : #BrGlamorousTabGroupHeaderLook,
	#superclass : #BrTabGroupHeaderLook,
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
	
	
	self add: (BrTabGroupSplitterLook new splitterDo: [ :anElement |
		anElement constraintsDo: [ :c |
			c ignoreByLayout ]
	])
]
