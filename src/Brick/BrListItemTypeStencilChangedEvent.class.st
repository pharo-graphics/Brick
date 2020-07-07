Class {
	#name : #BrListItemTypeStencilChangedEvent,
	#superclass : #BlEvent,
	#instVars : [
		'itemTypeStencil'
	],
	#category : #'Brick-List - Events'
}

{ #category : #accessing }
BrListItemTypeStencilChangedEvent >> itemTypeStencil [
	^ itemTypeStencil
]

{ #category : #accessing }
BrListItemTypeStencilChangedEvent >> itemTypeStencil: anObject [
	itemTypeStencil := anObject
]
