Class {
	#name : #BrSizeAdjustmentChanged,
	#superclass : #BrStateChangedEvent,
	#instVars : [
		'dimension'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrSizeAdjustmentChanged class >> isDeprecated [
	^ true
]

{ #category : #accessing }
BrSizeAdjustmentChanged >> dimension [
	<return: #Symbol>

	^ dimension
]

{ #category : #accessing }
BrSizeAdjustmentChanged >> dimension: aSymbol [
	dimension := aSymbol
]

{ #category : #initialization }
BrSizeAdjustmentChanged >> initialize [
	super initialize.
	
	dimension := #default
]

{ #category : #accessing }
BrSizeAdjustmentChanged >> state: anObject [
	"Override me to properly set the given state"

	self dimension: anObject
]
