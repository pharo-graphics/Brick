Class {
	#name : #BrSwitch,
	#superclass : #BlElement,
	#traits : 'TBrSwitchable + TBrEnableable + TBrLayoutResizable + TBrLayoutAlignable + TBrDeprecatedSizeAdjustable',
	#classTraits : 'TBrSwitchable classTrait + TBrEnableable classTrait + TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait + TBrDeprecatedSizeAdjustable classTrait',
	#instVars : [
		'labelModel',
		'iconModel'
	],
	#category : #'Brick-Switch - UI'
}

{ #category : #'api - size adjustable' }
BrSwitch >> beHuge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beHuge)
]

{ #category : #'api - size adjustable' }
BrSwitch >> beLarge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beLarge)
]

{ #category : #'api - size adjustable' }
BrSwitch >> beMini [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beMini)
]

{ #category : #'api - size adjustable' }
BrSwitch >> beNormal [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beNormal)
]

{ #category : #'api - size adjustable' }
BrSwitch >> beSmall [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beSmall)
]

{ #category : #'api - size adjustable' }
BrSwitch >> beTiny [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beTiny)
]

{ #category : #initialization }
BrSwitch >> initialize [
	super initialize.

	self viewModel: ((labelModel := BrLabelModel new) +
		(iconModel := BrIconModel new) + 
		(BrInteractiveModel new
			addStates: {
				BrSwitchModel new.
				BrLayoutAlignmentModel center.
			}))
]
