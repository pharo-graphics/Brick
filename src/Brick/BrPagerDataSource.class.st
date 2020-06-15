Class {
	#name : #BrPagerDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'pageElements'
	],
	#category : #'Brick-Pager - Support'
}

{ #category : #initialization }
BrPagerDataSource >> initialize [
	super initialize.
	
	pageElements := OrderedCollection new
]

{ #category : #accessing }
BrPagerDataSource >> itemCount [
	^ self pageElements size
]

{ #category : #'instance creation' }
BrPagerDataSource >> onBindHolder: anElementHolder at: aPosition [
	anElementHolder pageElement: (self pageElements at: aPosition)
]

{ #category : #'instance creation' }
BrPagerDataSource >> onCreateHolder: anInfiniteElement type: anItemType [
	^ BrPagerPageHolder new
]

{ #category : #hooks }
BrPagerDataSource >> onElementRecycled: anElementHolder [
	super onElementRecycled: anElementHolder.
	
	anElementHolder onRecycled
]

{ #category : #accessing }
BrPagerDataSource >> pageElements [
	^ pageElements
]

{ #category : #accessing }
BrPagerDataSource >> pageElements: aCollectionOfElements [
	pageElements := aCollectionOfElements.
	self notifyChanged
]
