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
	})
]
