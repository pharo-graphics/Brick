Class {
	#name : #BrListSelectedItemAttached,
	#superclass : #BlEvent,
	#instVars : [
		'itemElement',
		'rowIndex',
		'rowValue'
	],
	#category : 'Brick-List - Events'
}

{ #category : #accessing }
BrListSelectedItemAttached >> itemElement [
	^ itemElement
]

{ #category : #accessing }
BrListSelectedItemAttached >> itemElement: anObject [
	itemElement := anObject
]

{ #category : #accessing }
BrListSelectedItemAttached >> rowIndex [
	^ rowIndex
]

{ #category : #accessing }
BrListSelectedItemAttached >> rowIndex: anObject [
	rowIndex := anObject
]

{ #category : #accessing }
BrListSelectedItemAttached >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrListSelectedItemAttached >> rowValue: anObject [
	rowValue := anObject
]
