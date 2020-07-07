Class {
	#name : #BrListItemDataBinderChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'itemDataBinder'
	],
	#category : #'Brick-List - Events'
}

{ #category : #accessing }
BrListItemDataBinderChangedEvent >> itemDataBinder [
	^ itemDataBinder
]

{ #category : #accessing }
BrListItemDataBinderChangedEvent >> itemDataBinder: anObject [
	itemDataBinder := anObject
]
