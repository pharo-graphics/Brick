Class {
	#name : #BrGlamorousSpaceTabGroupHeaderLook,
	#superclass : #BrTabGroupHeaderLook,
	#category : #'Brick-Glamorous-Tabs - Support'
}

{ #category : #initialization }
BrGlamorousSpaceTabGroupHeaderLook >> initialize [
	super initialize.
	
	"
	- scrollbar
		- 
	
	
	"
	
	self add: (BrLayoutResizerLook inherit
		
	).
	
	
	self scrollTabbarDo: [ :anElement | anElement look: BrLayoutLook frame hMatchParent vFitContent alignCenter ].
	self headerDo: [ :anElement | anElement look: BrLayoutLook linearHorizontal hMatchParent vFitContent ].
	self tabbarDo: [ :anElement | anElement look: BrLayoutLook linearHorizontal hFitContent vFitContent ].
	"toolbar here is not a toolbar itself, it is a container for it, the actual toolbar is built using a stencil from BrTabModel"
	self toolbarDo: [ :anElement | anElement look: BrLayoutLook linearHorizontal fitContent alignCenter ]
]
