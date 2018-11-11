Class {
	#name : #BrBadge,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'labelModel',
		'iconModel',
		'activationModel',
		'dimensionModel'
	],
	#category : #'Brick-Badge - UI'
}

{ #category : #initialization }
BrBadge >> initialize [
	super initialize.

	self viewModel: (BrButtonModel new +
		(labelModel := BrLabelModel new) +
		(iconModel := BrIconModel new) + 
		(BrInteractiveModel withAll: {
				activationModel := BrActivationModel new.
				dimensionModel := BrDimensionModel new.
				BrPressModel new.
				BrHoverModel new.
				BrLayoutHorizontalResizerModel new.
				BrLayoutVerticalResizerModel new }))
]

{ #category : #accessing }
BrBadge >> label: aString [
	labelModel text: aString
]
