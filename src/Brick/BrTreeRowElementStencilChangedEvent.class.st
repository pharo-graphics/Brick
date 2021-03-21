Class {
	#name : #BrTreeRowElementStencilChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'rowElementStencil'
	],
	#category : #'Brick-Tree - Events'
}

{ #category : #accessing }
BrTreeRowElementStencilChangedEvent >> rowElementStencil [
	^ rowElementStencil
]

{ #category : #accessing }
BrTreeRowElementStencilChangedEvent >> rowElementStencil: anObject [
	rowElementStencil := anObject
]
