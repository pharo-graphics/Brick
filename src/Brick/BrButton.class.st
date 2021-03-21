Class {
	#name : #BrButton,
	#superclass : #BlElement,
	#traits : 'TBrEnableable + TBrLayoutAlignable + TBrLayoutResizable + TBrSizeAdjustable',
	#classTraits : 'TBrEnableable classTrait + TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait + TBrSizeAdjustable classTrait',
	#instVars : [
		'labelModel',
		'iconModel',
		'interactiveModel'
	],
	#category : #'Brick-Button - UI'
}

{ #category : #'api - widget' }
BrButton >> action [
	^ self viewModel action
]

{ #category : #'api - widget' }
BrButton >> action: aValuable [
	"An action can be a block with two optional parameters:
	 - a UI element to which this button model is attached
	 - this button model
	[ :aButtonElement :aButtonModel :anEvent |  ].

	Button action must not be nil"

	self viewModel action: aValuable
]

{ #category : #'api - widget' }
BrButton >> icon [
	^ iconModel icon
]

{ #category : #'api - widget' }
BrButton >> icon: anElement [
	iconModel icon: anElement
]

{ #category : #initialization }
BrButton >> initialize [
	super initialize.
	
	self
		hFitContent;
		vLocal;
		beNormalSize.
	
	self viewModel: (BrButtonModel new +
		(labelModel := BrLabelModel new) +
		(iconModel := BrIconModel new) + 
		(BrInteractiveModel new
			addStates: {
				BrLayoutAlignmentModel center.
			}))
]

{ #category : #'api - widget' }
BrButton >> label [
	^ labelModel text
]

{ #category : #'api - widget' }
BrButton >> label: aStringOrBrText [
	labelModel text: aStringOrBrText
]

{ #category : #'api - widget' }
BrButton >> model [
	^ self viewModel model
]

{ #category : #'api - widget' }
BrButton >> model: anObject [
	self viewModel model: anObject
]
