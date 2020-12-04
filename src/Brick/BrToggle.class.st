Class {
	#name : #BrToggle,
	#superclass : #BlElement,
	#traits : 'TBrEnableable + TBrLayoutAlignable + TBrLayoutResizable + TBrDeprecatedSizeAdjustable',
	#classTraits : 'TBrEnableable classTrait + TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait + TBrDeprecatedSizeAdjustable classTrait',
	#instVars : [
		'labelModel',
		'iconModel'
	],
	#category : #'Brick-Toggle - UI'
}

{ #category : #'api - toggle' }
BrToggle >> activate [
	"Activate the toggle if it is deactivated, otherwise do nothing"

	self viewModel activate
]

{ #category : #'api - toggle' }
BrToggle >> activated: aBoolean [
	self viewModel activated: aBoolean
]

{ #category : #'api - size adjustable' }
BrToggle >> beHuge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beHuge)
]

{ #category : #'api - size adjustable' }
BrToggle >> beLarge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beLarge)
]

{ #category : #'api - size adjustable' }
BrToggle >> beMini [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beMini)
]

{ #category : #'api - size adjustable' }
BrToggle >> beNormal [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beNormal)
]

{ #category : #'api - size adjustable' }
BrToggle >> beSmall [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beSmall)
]

{ #category : #'api - size adjustable' }
BrToggle >> beTiny [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beTiny)
]

{ #category : #'api - toggle' }
BrToggle >> deactivate [
	"Deactivate the toggle if it is activated, otherwise do nothing"

	self viewModel deactivate
]

{ #category : #'api - widget' }
BrToggle >> icon [
	<return: #BlElement>

	^ iconModel icon
]

{ #category : #'api - widget' }
BrToggle >> icon: anElement [
	iconModel icon: anElement
]

{ #category : #initialization }
BrToggle >> initialize [
	super initialize.
	
	self
		fitContent.
	
	self viewModel: (BrToggleModel new +
		(labelModel := BrLabelModel new) +
		(iconModel := BrIconModel new) +
		(BrInteractiveModel new
			addStates: {
				BrLayoutAlignmentModel center.
			}))
]

{ #category : #'api - toggle' }
BrToggle >> isActivated [
	<return: #Boolean>

	^ self viewModel isActivated
]

{ #category : #'api - widget' }
BrToggle >> label [
	<return: #BlText>

	^ labelModel text
]

{ #category : #'api - widget' }
BrToggle >> label: aStringOrBrText [
	labelModel text: aStringOrBrText
]

{ #category : #'api - toggle' }
BrToggle >> toggle [
	"Invert the toggle's state:
	 - activate if the toggle is deactivated
	 - deactivate if the toggle is already activated"

	self viewModel toggle
]
