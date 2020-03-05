Class {
	#name : #BrPagerModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'pages'
	],
	#category : #'Brick-Pager - Model'
}

{ #category : #'api - adding / removing' }
BrPagerModel >> addPage: aPageModel [
	self pages add: aPageModel.
	self onPageAdded: aPageModel
]

{ #category : #testing }
BrPagerModel >> hasPageAfter: aPageModel [
	| aPageIndex |
	aPageIndex := self pages
		indexOf: aPageModel
		ifAbsent: [ ^ false ].
	^ aPageIndex < self pages size
]

{ #category : #initialization }
BrPagerModel >> initialize [
	super initialize.

	pages := OrderedCollection new
]

{ #category : #hooks }
BrPagerModel >> initializeListeners [
	super initializeListeners.

	"answer if somebody is interested in what pages I have"
	self when: BrPagerPagesRequest reply: [ BrPagerPagesChanged pages: self pages ].
]

{ #category : #notifying }
BrPagerModel >> notifyPageAdded: aPageModel [
	self dispatchEvent: (BrPagerPageAddedEvent page: aPageModel)
]

{ #category : #notifying }
BrPagerModel >> notifyPageRemoved: aPageModel [
	self dispatchEvent: (BrPagerPageRemovedEvent page: aPageModel)
]

{ #category : #notifying }
BrPagerModel >> notifyPagesChanged [
	self dispatchEvent: (BrPagerPagesChanged pages: self pages)
]

{ #category : #hooks }
BrPagerModel >> onPageAdded: aPageModel [
	self notifyPageAdded: aPageModel
]

{ #category : #hooks }
BrPagerModel >> onPageRemoved: aPageModel [
	self notifyPageRemoved: aPageModel
]

{ #category : #'api - adding / removing' }
BrPagerModel >> pageAfter: aPageModel ifFound: ifFoundBlock ifNone: ifNoneBlock [
	| aPageIndex |
	
	aPageIndex := self pages
		indexOf: aPageModel
		ifAbsent: [ self error: aPageModel gtDisplayString, ' is not in the list of pages.' ].
	
	aPageIndex < self pages size
		ifTrue: [ ifFoundBlock value: (self pages at: aPageIndex + 1) ]
		ifFalse: [ ifNoneBlock value ]
]

{ #category : #accessing }
BrPagerModel >> pages [
	<return: #Collection of: #BrPagerPageModel>

	^ pages
]

{ #category : #'api - adding / removing' }
BrPagerModel >> pages: aCollectionOfPages [
	pages := aCollectionOfPages asOrderedCollection.

	self notifyPagesChanged
]

{ #category : #'api - adding / removing' }
BrPagerModel >> removeAllPages [
	self pages reverseDo: [ :eachPage | self removePage: eachPage ]
]

{ #category : #'api - adding / removing' }
BrPagerModel >> removePage: aPageModel [
	| aPageIndex |
	
	aPageIndex := self pages indexOf: aPageModel.
	self removePageAt: aPageIndex
]

{ #category : #'api - adding / removing' }
BrPagerModel >> removePageAt: aPageIndex [
	| aPageToRemove |
	
	aPageToRemove := self pages at: aPageIndex.
	self pages removeAt: aPageIndex.
	self onPageRemoved: aPageToRemove
]

{ #category : #'api - adding / removing' }
BrPagerModel >> removePagesAfter: aPageModel [
	| aPageIndex |
	
	aPageIndex := self pages
		indexOf: aPageModel
		ifAbsent: [ ^ self ].
	
	aPageIndex = self pages size
		ifTrue: [ ^ self ].
	
	self removePagesAfterIndex: aPageIndex + 1
]

{ #category : #'api - adding / removing' }
BrPagerModel >> removePagesAfterIndex: aPageIndex [
	(self pages size to: aPageIndex by: -1) do: [ :eachIndex |
		self removePage: (self pages at: eachIndex) ]
]
