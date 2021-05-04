Class {
	#name : #BrProportionalVerticalPagerAptitude,
	#superclass : #BrPagerAptitude,
	#instVars : [
		'pagesListElement',
		'resizers'
	],
	#category : #'Brick-Pager - Look'
}

{ #category : #accessing }
BrProportionalVerticalPagerAptitude >> hideResizers [
	self resizers do: [ :eachResizer | eachResizer visibility: BlVisibility hidden ]
]

{ #category : #initialization }
BrProportionalVerticalPagerAptitude >> initialize [
	super initialize.

	resizers := OrderedDictionary new.

	pagesListElement := BlElement new.
	pagesListElement layout: BlLinearLayout vertical.
	pagesListElement
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].

	self addChangeAddChildAs: #(content list) with: [ pagesListElement ]
]

{ #category : #hooks }
BrProportionalVerticalPagerAptitude >> onPage: aPageModel elementAttached: aPageElement [

	aPageElement
		constraintsDo: [ :c | c vertical matchParent ].

	pagesListElement hasChildren
		ifTrue: [
			| aResizerTarget aResizer |
			aResizerTarget := pagesListElement children last.
			
			aResizer := BrResizer new
				aptitude: BrGlamorousResizerAptitude;
				target: pagesListElement children last;
				beBottom;
				when: BlResizerResizedEvent
					do: [ :anEvent | self onResized: aResizerTarget to: anEvent extent and: aPageElement ].
			resizers at: aResizerTarget put: aResizer.
			pagesListElement addChild: aResizer ].

	pagesListElement addChild: aPageElement
]

{ #category : #hooks }
BrProportionalVerticalPagerAptitude >> onPage: aPageModel elementDetached: aPageElement [
	pagesListElement removeChild: aPageElement
]

{ #category : #hooks }
BrProportionalVerticalPagerAptitude >> onResized: aLeftPageElement to: anExtent and: aRightPageElement [
	| availableSize availableWeight aTopWeight aBottomWeight |
	
	aLeftPageElement constraintsDo: [ :c | c vertical matchParent ].
	aRightPageElement constraintsDo: [ :c | c vertical matchParent ].

	availableSize := aLeftPageElement height + aRightPageElement height.
	
	availableWeight := aLeftPageElement constraints linear weight + aRightPageElement constraints linear weight.

	aTopWeight := (anExtent y / availableSize) asFloat min: 0.95 max: 0.05.
	aBottomWeight := 1.0 - aTopWeight.

	aLeftPageElement constraintsDo: [ :c | c linear weight: availableWeight * aTopWeight ].
	aRightPageElement constraintsDo: [ :c | c linear weight: availableWeight * aBottomWeight ].
]

{ #category : #accessing }
BrProportionalVerticalPagerAptitude >> resizers [
	<return: #Collection of: #BrResizer>

	^ resizers
]

{ #category : #accessing }
BrProportionalVerticalPagerAptitude >> showResizers [
	self resizers do: [ :eachResizer | eachResizer visibility: BlVisibility visible ]
]
