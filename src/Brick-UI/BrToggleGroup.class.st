Class {
	#name : #BrToggleGroup,
	#superclass : #Object,
	#instVars : [
		'toggles'
	],
	#category : 'Brick-UI-Toggle'
}

{ #category : #'as yet unclassified' }
BrToggleGroup >> addToggle: aToggle [
	aToggle selectedProperty
		onChangedDo: [ :v | 
			v
				ifTrue: [ self selectToggle: aToggle ] ].
	self toggles add: aToggle
]

{ #category : #'as yet unclassified' }
BrToggleGroup >> initialize [
	super initialize.
	toggles := OrderedCollection new
]

{ #category : #'as yet unclassified' }
BrToggleGroup >> selectToggle: aToggle [

	self toggles do: [ :t | t selected: false ] without: aToggle
]

{ #category : #accessing }
BrToggleGroup >> toggles [
	^ toggles
]

{ #category : #accessing }
BrToggleGroup >> toggles: anObject [
	toggles := anObject
]
