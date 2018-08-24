Class {
	#name : #BrListItemElementAttached,
	#superclass : #BlEvent,
	#instVars : [
		'itemElement',
		'rowIndex',
		'rowValue'
	],
	#category : 'Brick-List - Events'
}

{ #category : #accessing }
BrListItemElementAttached >> itemElement [
	^ itemElement
]

{ #category : #accessing }
BrListItemElementAttached >> itemElement: anObject [
	itemElement := anObject
]

{ #category : #accessing }
BrListItemElementAttached >> rowIndex [
	^ rowIndex
]

{ #category : #accessing }
BrListItemElementAttached >> rowIndex: anObject [
	rowIndex := anObject
]

{ #category : #accessing }
BrListItemElementAttached >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrListItemElementAttached >> rowValue: anObject [
	rowValue := anObject
]
