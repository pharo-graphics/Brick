Class {
	#name : #BrScrollablePagerAptitude,
	#superclass : #BrPagerAptitude,
	#instVars : [
		'pagesListElement'
	],
	#category : #'Brick-Pager - Look'
}

{ #category : #initialization }
BrScrollablePagerAptitude >> initialize [
	super initialize.

	pagesListElement := BrInfinitePagerElement new.

	self add: (BrLayoutResizerAptitude new inherit: pagesListElement).
	pagesListElement addAptitude: (BrLayoutResizerAptitude new inherit; inherit: [ pagesListElement children ]).

	self addChangeAddChildAs: #(content list) with: [ pagesListElement ].
	self add: (BrLayoutResizerAptitude inherit inherit: pagesListElement)
]

{ #category : #initialization }
BrScrollablePagerAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrPagerScrollWish do: [ :anEvent |
		anEvent consumed: true.
		anEvent isSmooth
			ifTrue: [ self smoothScrollTo: anEvent pageIndex ]
			ifFalse: [ self scrollTo: anEvent pageIndex ] ]
]

{ #category : #hooks }
BrScrollablePagerAptitude >> onPage: aPageModel elementAttached: aPageElement [
	pagesListElement dataSource pageElements: self pageElements
]

{ #category : #hooks }
BrScrollablePagerAptitude >> onPage: aPageMopdel elementDetached: aPageElement [
	pagesListElement dataSource pageElements: self pageElements
]

{ #category : #'api - scrolling' }
BrScrollablePagerAptitude >> scrollTo: aPageIndex [
	pagesListElement scrollToPosition: aPageIndex
]

{ #category : #'api - scrolling' }
BrScrollablePagerAptitude >> smoothScrollTo: aPageIndex [
	pagesListElement smoothScrollToPosition: aPageIndex
]
