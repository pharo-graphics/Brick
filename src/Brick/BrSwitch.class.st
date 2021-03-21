Class {
	#name : #BrSwitch,
	#superclass : #BlElement,
	#traits : 'TBrSwitchable + TBrEnableable + TBrLayoutResizable + TBrLayoutAlignable + TBrSizeAdjustable',
	#classTraits : 'TBrSwitchable classTrait + TBrEnableable classTrait + TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait + TBrSizeAdjustable classTrait',
	#instVars : [
		'labelModel',
		'iconModel'
	],
	#category : #'Brick-Switch - UI'
}

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
