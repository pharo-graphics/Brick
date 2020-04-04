Class {
	#name : #BrCheckbox,
	#superclass : #BlElement,
	#traits : 'TBrCheckable + TBrEnableable + TBrLayoutResizable + TBrLayoutAlignable + TBrSizeAdjustable',
	#classTraits : 'TBrCheckable classTrait + TBrEnableable classTrait + TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait + TBrSizeAdjustable classTrait',
	#category : #'Brick-Checkbox - UI'
}

{ #category : #initialization }
BrCheckbox >> initialize [
	super initialize.

	self viewModel: (
		(BrInteractiveModel new
			addStates: {
				BrCheckboxModel new.
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
