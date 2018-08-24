Class {
	#name : #BrActionItem,
	#superclass : #BrButton,
	#category : 'Brick-Experimental-Toolbar'
}

{ #category : #'as yet unclassified' }
BrActionItem >> action: aBlock [
	self eventDispatcher
		removeEventHandlers;
		addEventHandler: (BrOnClickHandler do: aBlock)
]

{ #category : #'as yet unclassified' }
BrActionItem >> initialize [
	super initialize.
	self styleClass: #item.
	self constraintsDo: [ :c| c linear vertical alignCenter ]
]
