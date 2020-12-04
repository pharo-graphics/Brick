Class {
	#name : #BrBadge,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'labelModel',
		'activationModel',
		'dimensionModel'
	],
	#category : #'Brick-Badge - UI'
}

{ #category : #'api - widget' }
BrBadge >> action [
	^ self viewModel action
]

{ #category : #'api - widget' }
BrBadge >> action: aValuable [
	self viewModel action: aValuable
]

{ #category : #initialization }
BrBadge >> initialize [
	super initialize.

	self viewModel: (BrButtonModel new +
		(labelModel := BrLabelModel new))
]

{ #category : #'api - widget' }
BrBadge >> label [
	^ labelModel text
]

{ #category : #'api - widget' }
BrBadge >> label: aString [
	labelModel text: aString
]
