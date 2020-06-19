Class {
	#name : #BrWidgetContainer,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrLayoutAlignable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait',
	#category : #'Brick-Layout Widgets'
}

{ #category : #initialization }
BrWidgetContainer >> initialize [
	super initialize.
	
	self viewModel: (BrInteractiveModel new addStates: {
		BrLayoutAlignmentModel new.
		BrLayoutHorizontalResizerModel exact: 50.0.
		BrLayoutVerticalResizerModel exact: 50.0.
	})
]
