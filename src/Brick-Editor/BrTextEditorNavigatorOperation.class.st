Class {
	#name : #BrTextEditorNavigatorOperation,
	#superclass : #Object,
	#instVars : [
		'cursor'
	],
	#category : #'Brick-Editor-Model - Operators'
}

{ #category : #'instance creation' }
BrTextEditorNavigatorOperation class >> cursor: aCursor [
	^ self new cursor: aCursor
]

{ #category : #accessing }
BrTextEditorNavigatorOperation >> cursor [
	^ cursor
]

{ #category : #accessing }
BrTextEditorNavigatorOperation >> cursor: anObject [
	cursor := anObject
]

{ #category : #matching }
BrTextEditorNavigatorOperation >> performOn: aNavigator [
	self subclassResponsibility
]
