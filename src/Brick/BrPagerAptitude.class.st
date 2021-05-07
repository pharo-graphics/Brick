Class {
	#name : #BrPagerAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'pages'
	],
	#category : #'Brick-Pager - Look'
}

{ #category : #initialization }
BrPagerAptitude >> initialize [
	super initialize.

	pages := OrderedDictionary new.
	
	self add: BrLayoutResizerAptitude inherit
]

{ #category : #initialization }
BrPagerAptitude >> initializeListeners [
	super initializeListeners.

	self when: BrPagerPagesChanged do: [ :anEvent | self onPagesChanged: anEvent pages ].
	self when: BrPagerPageAddedEvent do: [ :anEvent | self onPageAdded: anEvent page ].
	self when: BrPagerPageRemovedEvent do: [ :anEvent | self onPageRemoved: anEvent page ]
]

{ #category : #initialization }
BrPagerAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrPagerPagesRequest new
]

{ #category : #hooks }
BrPagerAptitude >> onPage: aPageModel elementAttached: aPageElement [
]

{ #category : #hooks }
BrPagerAptitude >> onPage: aPageMopdel elementDetached: aPageElement [
]

{ #category : #hooks }
BrPagerAptitude >> onPageAdded: aPageModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the page added event without being attached to a widget' ].

	self pages at: aPageModel put: nil.

	aPageModel whenAttachedDo: [ :aPageContentElement | self onPageContentAttached: aPageContentElement ]
]

{ #category : #hooks }
BrPagerAptitude >> onPageContentAttached: aPageContentElement [
	| aPageModel aPageElement |

	aPageModel := aPageContentElement viewModel.

	aPageContentElement removeFromParent.
	aPageElement := (aPageModel embellisher contentElement: aPageContentElement) asElement.	
	self pages at: aPageModel put: aPageElement.

	self onPage: aPageModel elementAttached: aPageElement
]

{ #category : #hooks }
BrPagerAptitude >> onPageRemoved: aPageModel [
	| aPageElement |
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the page removed event without being attached to a widget' ].

	aPageElement := self pages removeKey: aPageModel.
	self onPage: aPageModel elementDetached: aPageElement
]

{ #category : #hooks }
BrPagerAptitude >> onPagesChanged: aCollectionOfModels [
	
	self pages removeAll.
	aCollectionOfModels do: [ :aPageModel |
		self pages at: aPageModel put: nil ].

	aCollectionOfModels do: [ :aPageModel |
		aPageModel whenAttachedDo: [ :aPageContentElement |
			self onPageContentAttached: aPageContentElement ] ]
]

{ #category : #accessing }
BrPagerAptitude >> pageElements [
	^ self pages values select: #isNotNil
]

{ #category : #accessing }
BrPagerAptitude >> pages [
	^ pages
]
