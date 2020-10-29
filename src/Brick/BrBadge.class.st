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
BrBadge >> action: aValuable [
	self viewModel action: aValuable
]

{ #category : #initialization }
BrBadge >> initialize [
	super initialize.

	self viewModel: (BrButtonModel new +
		(labelModel := BrLabelModel new) +
		(BrInteractiveModel withAll: {
				activationModel := BrEnablementModel new.
				dimensionModel := BrSizeAdjustmentModel new.
				BrPressModel new.
				BrHoverModel new.
				BrLayoutHorizontalResizerModel new.
				BrLayoutVerticalResizerModel new }))
]

{ #category : #'api - widget' }
BrBadge >> label: aString [
	labelModel text: aString
]
