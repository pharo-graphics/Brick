Class {
	#name : #BrTextEditorHistoryCursorMovementCommand,
	#superclass : #BrTextEditorHistoryCommand,
	#instVars : [
		'fromIndices',
		'toIndices'
	],
	#category : #'Brick-Editor-History'
}

{ #category : #accessing }
BrTextEditorHistoryCursorMovementCommand >> fromIndices [
	^ fromIndices
]

{ #category : #accessing }
BrTextEditorHistoryCursorMovementCommand >> fromIndices: anObject [
	fromIndices := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryCursorMovementCommand >> redoOn: aBrTextEditor [
	| aNavigator |
	
	aNavigator := aBrTextEditor navigator.
	fromIndices do: [ :eachIndex | aNavigator removeAt: eachIndex ].
	toIndices do: [ :eachIndex | aNavigator addAt: eachIndex ].
	aNavigator apply
]

{ #category : #accessing }
BrTextEditorHistoryCursorMovementCommand >> toIndices [
	^ toIndices
]

{ #category : #accessing }
BrTextEditorHistoryCursorMovementCommand >> toIndices: anObject [
	toIndices := anObject
]

{ #category : #'api - undo/redo' }
BrTextEditorHistoryCursorMovementCommand >> undoOn: aBrTextEditor [
	| aNavigator |
	
	aNavigator := aBrTextEditor navigator.
	toIndices do: [ :eachIndex | aNavigator removeAt: eachIndex ].
	fromIndices do: [ :eachIndex | aNavigator addAt: eachIndex ].
	aNavigator apply
]
