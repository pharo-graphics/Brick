Class {
	#name : #BrScrollablePagerLook,
	#superclass : #BrPagerLook,
	#instVars : [
		'pagesListElement'
	],
	#category : #'Brick-Pager - Look'
}

{ #category : #initialization }
BrScrollablePagerLook >> initialize [
	super initialize.
	
	pagesListElement := BrInfinitePagerElement new.
	pagesListElement
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ].

	self addChangeAddChildAs: #(content list) with: [ pagesListElement ]
]

{ #category : #initialization }
BrScrollablePagerLook >> initializeListeners [
	super initializeListeners.

	self when: BrPagerScrollWish do: [ :anEvent |
		anEvent consumed: true.
		anEvent isSmooth
			ifTrue: [ self smoothScrollTo: anEvent pageIndex ]
			ifFalse: [ self scrollTo: anEvent pageIndex ] ]
]

{ #category : #hooks }
BrScrollablePagerLook >> onPage: aPageModel elementAttached: aPageElement [
	pagesListElement dataSource pageElements: self pageElements
]

{ #category : #hooks }
BrScrollablePagerLook >> onPage: aPageMopdel elementDetached: aPageElement [
	pagesListElement dataSource pageElements: self pageElements
]

{ #category : #'api - scrolling' }
BrScrollablePagerLook >> scrollTo: aPageIndex [
	pagesListElement scrollToPosition: aPageIndex
]

{ #category : #'api - scrolling' }
BrScrollablePagerLook >> smoothScrollTo: aPageIndex [
	pagesListElement smoothScrollToPosition: aPageIndex
]
