Class {
	#name : #BrListItemIdStencilChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'itemIdStencil'
	],
	#category : #'Brick-List - Events'
}

{ #category : #accessing }
BrListItemIdStencilChangedEvent >> itemIdStencil [
	^ itemIdStencil
]

{ #category : #accessing }
BrListItemIdStencilChangedEvent >> itemIdStencil: anObject [
	itemIdStencil := anObject
]
