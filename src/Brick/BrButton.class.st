Class {
	#name : #BrButton,
	#superclass : #BlElement,
	#traits : 'TBrLayoutAlignable + TBrLayoutResizable',
	#classTraits : 'TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'labelModel',
		'iconModel',
		'activationModel',
		'interactiveModel',
		'dimensionModel',
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
	self viewModel action: aValuable
]

{ #category : #'api - dimension' }
BrButton >> beDefault [
	dimensionModel beDefault
]

{ #category : #'api - dimension' }
BrButton >> beHuge [
	dimensionModel beHuge
]

{ #category : #'api - dimension' }
BrButton >> beLarge [
	dimensionModel beLarge
]

{ #category : #'api - dimension' }
BrButton >> beSmall [
	dimensionModel beSmall
]

{ #category : #'api - dimension' }
BrButton >> beTiny [
	dimensionModel beTiny
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
				activationModel := BrActivationModel new.
				BrPressModel new.
				BrHoverModel new.
				dimensionModel := BrDimensionModel new.
				expandableModel := BrExpandableModel new.
				BrSelectModel new.
				BrLayoutAlignmentModel new.
				BrLayoutHorizontalResizerModel fitContent.
				BrLayoutVerticalResizerModel fitContent
			}))
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
