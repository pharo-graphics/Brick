Class {
	#name : #BrPagerModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'pages'
	],
	#category : 'Brick-Pager - Model'
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
BrPagerModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	"answer if somebody is interested in what pages I have"
	self when: BrPagerPagesRequest reply: [ BrPagerPagesChanged pages: self pages ].
	
]

{ #category : #hooks }
BrPagerModel >> onPageAdded: aPageModel [
	self notifyPageAdded: aPageModel
]

{ #category : #hooks }
BrPagerModel >> onPageRemoved: aPageModel [
	self notifyPageRemoved: aPageModel
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
BrPagerModel >> removePage: aPageModel [
	self pages remove: aPageModel.
	self onPageRemoved: aPageModel
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
