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

	self add: (BrLayoutResizerLook new inherit: pagesListElement).
	pagesListElement addLook: (BrLayoutResizerLook new inherit; inherit: [ pagesListElement children ]).

	self addChangeAddChildAs: #(content list) with: [ pagesListElement ].
	self add: (BrLayoutResizerLook inherit inherit: pagesListElement)
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
