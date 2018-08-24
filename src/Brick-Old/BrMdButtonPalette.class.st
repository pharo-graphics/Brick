Class {
	#name : #BrMdButtonPalette,
	#superclass : #BrButtonPalette,
	#instVars : [
		'name'
	],
	#category : 'Brick-Old'
}

{ #category : #'as yet unclassified' }
BrMdButtonPalette class >> colorNamed: aSymbol [
	^ self new initializeWithColorNamed: aSymbol
]

{ #category : #initialization }
BrMdButtonPalette >> initializeWithColorNamed: aColorName [
	self name: aColorName
]

{ #category : #accessing }
BrMdButtonPalette >> name [
	^ name
]

{ #category : #accessing }
BrMdButtonPalette >> name: anObject [
	name := anObject
]
