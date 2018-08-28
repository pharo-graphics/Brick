Class {
	#name : #BrButton,
	#superclass : #BlElement,
	#instVars : [
		'labelModel',
		'iconModel',
		'activationModel'
	],
	#category : #'Brick-Button - UI'
}

{ #category : #'api - widget' }
BrButton >> action: aValuable [
	self viewModel action: aValuable
]

{ #category : #'api - widget' }
BrButton >> disable [
	activationModel disable
]

{ #category : #'api - widget' }
BrButton >> enable [
	activationModel enable
]

{ #category : #'api - widget' }
BrButton >> enabled: aBoolean [
	activationModel enabled: aBoolean
]

{ #category : #'api - widget' }
BrButton >> icon: anElement [
	iconModel icon: anElement
]

{ #category : #initialization }
BrButton >> initialize [
	super initialize.
	
	self viewModel: (BrButtonModel new +
		(labelModel := BrLabelModel new) +
		(iconModel := BrIconModel new) + 
		(activationModel := BrActivationModel new))
]

{ #category : #'api - widget' }
BrButton >> isEnabled [
	^ activationModel isEnabled
]

{ #category : #'api - widget' }
BrButton >> label [
	^ labelModel text
]

{ #category : #'api - widget' }
BrButton >> label: aStringOrBrText [
	labelModel text: aStringOrBrText
]
