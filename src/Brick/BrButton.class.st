Class {
	#name : #BrButton,
	#superclass : #BlElement,
	#instVars : [
		'labelModel',
		'iconModel',
		'interactionModel'
	],
	#category : #'Brick-Button - UI'
}

{ #category : #'api - widget' }
BrButton >> action: aValuable [
	self viewModel action: aValuable
]

{ #category : #'api - widget' }
BrButton >> disable [
	interactionModel disable
]

{ #category : #'api - widget' }
BrButton >> enable [
	interactionModel enable
]

{ #category : #'api - widget' }
BrButton >> enabled: aBoolean [
	interactionModel enabled: aBoolean
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
		(interactionModel := BrInteractionModel new))
]

{ #category : #'api - widget' }
BrButton >> isEnabled [
	^ interactionModel isEnabled
]

{ #category : #'api - widget' }
BrButton >> label [
	^ labelModel text
]

{ #category : #'api - widget' }
BrButton >> label: aStringOrBrText [
	labelModel text: aStringOrBrText
]
