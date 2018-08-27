Class {
	#name : #BrTabsRequest,
	#superclass : #BrRequest,
	#category : 'Brick-Tabs - Events'
}

{ #category : #initialization }
BrTabsRequest >> responseClass [
	^ BrTabsChangedEvent
]
