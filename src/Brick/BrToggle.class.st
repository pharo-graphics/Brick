Class {
	#name : #BrToggle,
	#superclass : #BlElement,
	#traits : 'TBrEnableable + TBrLayoutAlignable + TBrLayoutResizable + TBrSizeAdjustable',
	#classTraits : 'TBrEnableable classTrait + TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait + TBrSizeAdjustable classTrait',
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
	
	self viewModel: (BrToggleModel new +
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
