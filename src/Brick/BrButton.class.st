Class {
	#name : #BrButton,
	#superclass : #BlElement,
	#traits : 'TBrEnableable + TBrLayoutAlignable + TBrLayoutResizable + TBrSizeAdjustable',
	#classTraits : 'TBrEnableable classTrait + TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait + TBrSizeAdjustable classTrait',
	#instVars : [
		'labelModel',
		'iconModel',
		'interactiveModel',
		'expandableModel'
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

{ #category : #'api - size adjustable' }
BrButton >> beDefault [
	self deprecated: 'Use #beNormal instead.' transformWith: '`@receiver beDefault' -> '`@receiver beNormal'.
	self beNormal
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
	
	self viewModel: (BrButtonModel new +
		(labelModel := BrLabelModel new) +
		(iconModel := BrIconModel new) + 
		(BrInteractiveModel new
			addStates: {
				BrEnablementModel new.
				BrPressModel new.
				BrHoverModel new.
				BrFocusModel new.
				BrSizeAdjustmentModel new.
				BrLayoutAlignmentModel center.
				BrLayoutHorizontalResizerModel fitContent.
				BrLayoutVerticalResizerModel fitContent
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
