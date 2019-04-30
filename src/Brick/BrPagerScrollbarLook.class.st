Class {
	#name : #BrPagerScrollbarLook,
	#superclass : #BrLook,
	#instVars : [
		'pages',
		'scrollbarElement'
	],
	#category : 'Brick-Pager - Look'
}

{ #category : #'instance creation' }
BrPagerScrollbarLook >> buildPreviewOfThePage: aPageContentElement [
	| aPreviewElement |
	aPageContentElement removeEventHandlersSuchThat: [ :each | each isKindOf: BrPagerPagePreviewResizeListener ].

	aPreviewElement := BlElement new
		margin: (BlInsets all: 3);
		border: (BlBorder paint: Color gray width: 2).
		
	aPageContentElement addEventHandler: (BrPagerPagePreviewResizeListener new previewElement: aPreviewElement).
	
	^ aPreviewElement
]

{ #category : #initialization }
BrPagerScrollbarLook >> initialize [
	super initialize.
	pages := OrderedDictionary new.
	scrollbarElement := BlElement new.
	scrollbarElement margin: (BlInsets top: 5).
	scrollbarElement layout: BlLinearLayout horizontal alignCenter.
	scrollbarElement
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
	changes
		add:
			(#(content preview)
				asBrLookChildAddAsChangeWithValue: [ scrollbarElement ])
]

{ #category : #initialization }
BrPagerScrollbarLook >> initializeListeners [
	super initializeListeners.

	self when: BrPagerPagesChanged do: [ :anEvent | self onPagesChanged: anEvent pages ].
	self when: BrPagerPageAddedEvent do: [ :anEvent | self onPageAdded: anEvent page ].
	self when: BrPagerPageRemovedEvent do: [ :anEvent | self onPageRemoved: anEvent page ]
]

{ #category : #initialization }
BrPagerScrollbarLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrPagerPagesRequest new
]

{ #category : #hooks }
BrPagerScrollbarLook >> onPageAdded: aPageModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the page added event without being attached to a widget' ].

	self pages at: aPageModel put: nil.

	aPageModel whenAttachedDo: [ :aPageContentElement |
		self pages at: aPageModel put: aPageContentElement.
		self updatePagePreviews ]
]

{ #category : #hooks }
BrPagerScrollbarLook >> onPageRemoved: aPageModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the page removed event without being attached to a widget' ].
	
	(self pages at: aPageModel) removeEventHandlersSuchThat: [ :each | each isKindOf: BrPagerPagePreviewResizeListener ].
	self pages removeKey: aPageModel.
	self updatePagePreviews
]

{ #category : #hooks }
BrPagerScrollbarLook >> onPagesChanged: aCollectionOfModels [

	self pages removeAll.
	aCollectionOfModels do: [ :aPageModel |
		self pages at: aPageModel put: nil ].

	aCollectionOfModels do: [ :aPageModel |
		aPageModel whenAttachedDo: [ :aPageElement |
			self pages at: aPageModel put: aPageElement.
			self updatePagePreviews ] ]
]

{ #category : #accessing }
BrPagerScrollbarLook >> pageElements [
	^ self pages values select: #isNotNil
]

{ #category : #accessing }
BrPagerScrollbarLook >> pages [
	^ pages
]

{ #category : #'as yet unclassified' }
BrPagerScrollbarLook >> updatePagePreviews [

	scrollbarElement removeChildren.

	self pageElements do: [ :aPageContentElement |
		scrollbarElement addChild: (self buildPreviewOfThePage: aPageContentElement) ]
]
