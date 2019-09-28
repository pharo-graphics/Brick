Class {
	#name : #BrListItemElementDetached,
	#superclass : #BlEvent,
	#instVars : [
		'rowIndex',
		'rowValue'
	],
	#category : 'Brick-List - Events'
}

{ #category : #accessing }
BrListItemElementDetached >> rowIndex [
	^ rowIndex
]

{ #category : #accessing }
BrListItemElementDetached >> rowIndex: anObject [
	rowIndex := anObject
]

{ #category : #accessing }
BrListItemElementDetached >> rowValue [
	^ rowValue
]

{ #category : #accessing }
BrListItemElementDetached >> rowValue: anObject [
	rowValue := anObject
]
