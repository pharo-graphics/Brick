Class {
	#name : #BrTreeRowDataBinderChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'rowDataBinder'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeRowDataBinderChangedEvent >> rowDataBinder [
	^ rowDataBinder
]

{ #category : #accessing }
BrTreeRowDataBinderChangedEvent >> rowDataBinder: anObject [
	rowDataBinder := anObject
]
