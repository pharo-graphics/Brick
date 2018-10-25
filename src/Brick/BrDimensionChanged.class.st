Class {
	#name : #BrDimensionChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Core - Events'
}

{ #category : #accessing }
BrDimensionChanged >> dimension [
	<return: #Symbol>

	^ dimension
]

{ #category : #accessing }
BrDimensionChanged >> dimension: aSymbol [
	dimension := aSymbol
]

{ #category : #initialization }
BrDimensionChanged >> initialize [
	super initialize.
	
	dimension := #default
]

{ #category : #accessing }
BrDimensionChanged >> state: anObject [
	"Override me to properly set the given state"

	self dimension: anObject
]
