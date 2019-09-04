"
I arrange my children vertically in a flow layout
"
Class {
	#name : #BrVerticalFlow,
	#superclass : #BlElement,
	#traits : 'TBrLayoutAlignable + TBrLayoutResizable',
	#classTraits : 'TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait',
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrVerticalFlow >> initialize [
	super initialize.
	
	self viewModel: (BrInteractiveModel new addStates: {
		BrLayoutAlignmentModel new.
		BrLayoutHorizontalResizerModel exact: 50.
		BrLayoutVerticalResizerModel exact: 50.
	}).

	self look: BrLayoutResizerLook inherit + BrLayoutAlignmentLook forVerticalFlowLayout
]
