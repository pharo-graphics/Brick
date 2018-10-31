Class {
	#name : #BrInteractiveStyler,
	#superclass : #Object,
	#instVars : [
		'styles'
	],
	#category : #'Brick-! Core - Support'
}

{ #category : #'instance creation' }
BrInteractiveStyler class >> on: anInteractiveLook [
	^ self new styles: anInteractiveLook styles
]

{ #category : #private }
BrInteractiveStyler >> addState: aState action: anActionBlock [
	self styles add: (BrInteractiveStyle new state: aState; action: anActionBlock)
]

{ #category : #initialization }
BrInteractiveStyler >> initialize [
	super initialize.
	
	styles := OrderedCollection new
]

{ #category : #accessing }
BrInteractiveStyler >> state [
	<return: #'BrInteractionState class'>

	^ self subclassResponsibility
]

{ #category : #accessing }
BrInteractiveStyler >> styles [
	^ styles
]

{ #category : #accessing }
BrInteractiveStyler >> styles: theStyles [
	styles := theStyles
]

{ #category : #builder }
BrInteractiveStyler >> when: aStateBlock style: aStyleBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	self addState: aTargetState action: aStyleBlock
]
