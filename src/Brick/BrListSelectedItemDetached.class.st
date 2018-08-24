Class {
	#name : #BrListSelectedItemDetached,
	#superclass : #BlEvent,
	#instVars : [
		'rowIndex',
		'rowValue'
	],
	#category : 'Brick-List - Events'
}

{ #category : #accessing }
BrListSelectedItemDetached >> rowIndex [
	^ rowIndex
]

{ #category : #accessing }
BrListSelectedItemDetached >> rowIndex: anObject [
	rowIndex := anObject
]

{ #category : #accessing }
BrListSelectedItemDetached >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrListSelectedItemDetached >> rowValue: anObject [
	rowValue := anObject
]
