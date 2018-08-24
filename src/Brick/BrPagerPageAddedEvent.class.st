"
I am sent by ${class:BrPagerModel}$ when a new ${class:BrPagerPageModel}$ is added to the pager
"
Class {
	#name : #BrPagerPageAddedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'page'
	],
	#category : 'Brick-Pager - Events'
}

{ #category : #'instance creation' }
BrPagerPageAddedEvent class >> page: aPageModel [
	^ self new page: aPageModel
]

{ #category : #accessing }
BrPagerPageAddedEvent >> page [
	^ page
]

{ #category : #accessing }
BrPagerPageAddedEvent >> page: anObject [
	page := anObject
]
