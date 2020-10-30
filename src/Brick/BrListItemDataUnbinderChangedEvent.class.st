Class {
	#name : #BrListItemDataUnbinderChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'itemDataUnbinder'
	],
	#category : #'Brick-List - Events'
}

{ #category : #accessing }
BrListItemDataUnbinderChangedEvent >> itemDataUnbinder [
	^ itemDataUnbinder
]

{ #category : #accessing }
BrListItemDataUnbinderChangedEvent >> itemDataUnbinder: anObject [
	itemDataUnbinder := anObject
]
