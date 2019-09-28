Class {
	#name : #BrPagerPagesChanged,
	#superclass : #BlEvent,
	#instVars : [
		'pages'
	],
	#category : 'Brick-Pager - Events'
}

{ #category : #accessing }
BrPagerPagesChanged class >> pages: aCollectionOfPages [
	^ self new pages: aCollectionOfPages
]

{ #category : #accessing }
BrPagerPagesChanged >> pages [
	^ pages
]

{ #category : #accessing }
BrPagerPagesChanged >> pages: anObject [
	pages := anObject
]
