Class {
	#name : #BrToolbar,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrLayoutAlignable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait',
	#category : #'Brick-Toolbar - UI'
}

{ #category : #'api - adding / removing' }
BrToolbar >> addItem: anElement [
	self viewModel addItem: anElement viewModel
]

{ #category : #'api - adding / removing' }
BrToolbar >> addItems: aCollectionOfWidgets [
	aCollectionOfWidgets
		do: [ :aWidgetElement | self viewModel addItem: aWidgetElement viewModel ]
]

{ #category : #testing }
BrToolbar >> hasItems [
	<return: #Boolean>
	
	^ self viewModel hasItems
]

{ #category : #initialization }
BrToolbar >> initialize [
	super initialize.
	self viewModel: (BrToolbarModel new + (BrInteractiveModel withAll: {
		BrLayoutAlignmentModel centerLeft.
		BrLayoutHorizontalResizerModel fitContent.
		BrLayoutVerticalResizerModel fitContent
	}))
]

{ #category : #accessing }
BrToolbar >> itemAt: anIndex [
	<return: #BrWidgetModel>

	^ self viewModel itemAt: anIndex
]

{ #category : #accessing }
BrToolbar >> numberOfItems [
	<return: #Number>

	^ self viewModel numberOfItems
]

{ #category : #'api - adding / removing' }
BrToolbar >> removeItem: anElement [
	self viewModel removeItem: anElement viewModel
]

{ #category : #'api - adding / removing' }
BrToolbar >> removeItemAt: anIndex [
	self viewModel removeItemAt: anIndex
]
