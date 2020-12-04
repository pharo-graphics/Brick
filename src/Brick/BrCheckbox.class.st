Class {
	#name : #BrCheckbox,
	#superclass : #BlElement,
	#traits : 'TBrCheckable + TBrEnableable + TBrLayoutResizable + TBrLayoutAlignable + TBrSizeAdjustable',
	#classTraits : 'TBrCheckable classTrait + TBrEnableable classTrait + TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait + TBrSizeAdjustable classTrait',
	#category : #'Brick-Checkbox - UI'
}

{ #category : #'api - button' }
BrCheckbox >> action [
	^ self viewModel action
]

{ #category : #'api - button' }
BrCheckbox >> action: aBlockClosure [
	"An action can be a block with two optional parameters:
	 - a UI element of the widget
	 - a button model
	[ :aCheckboxElement :aButtonModel :anEvent |  ].

	Checkbox action must not be nil"

	self viewModel action: aBlockClosure
]

{ #category : #'api - size adjustable' }
BrCheckbox >> beHuge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beHuge)
]

{ #category : #'api - size adjustable' }
BrCheckbox >> beLarge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beLarge)
]

{ #category : #'api - size adjustable' }
BrCheckbox >> beMini [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beMini)
]

{ #category : #'api - size adjustable' }
BrCheckbox >> beNormal [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beNormal)
]

{ #category : #'api - size adjustable' }
BrCheckbox >> beSmall [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beSmall)
]

{ #category : #'api - size adjustable' }
BrCheckbox >> beTiny [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beTiny)
]

{ #category : #initialization }
BrCheckbox >> initialize [
	super initialize.

	self
		vLocal;
		hLocal;
		beNormalSize.

	self viewModel: (
		BrButtonModel new
			addAll: {
				BrCheckboxModel new.
				(BrInteractiveModel new
					addStates: {
						BrLayoutAlignmentModel center.
					}) } )
]
