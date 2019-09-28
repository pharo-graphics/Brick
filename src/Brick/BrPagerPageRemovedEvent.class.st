"
I am sent by ${class:BrPagerModel}$ when a ${class:BrPagerPageModel}$ is removed from the pager
"
Class {
	#name : #BrPagerPageRemovedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'page'
	],
	#category : 'Brick-Pager - Events'
}

{ #category : #'instance creation' }
BrPagerPageRemovedEvent class >> page: aPageModel [
	^ self new page: aPageModel
]

{ #category : #accessing }
BrPagerPageRemovedEvent >> page [
	^ page
]

{ #category : #accessing }
BrPagerPageRemovedEvent >> page: anObject [
	page := anObject
]
