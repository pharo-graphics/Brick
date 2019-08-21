Class {
	#name : #BrTabGroup,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Tabs - UI'
}

{ #category : #accessing }
BrTabGroup >> actionbarStencil: anActionbarStencilBuilder [
	"See ${method:BrTabGroupModel>>#actionbarStencil:}"

	self viewModel actionbarStencil: anActionbarStencilBuilder
]

{ #category : #'api - adding / removing' }
BrTabGroup >> addTab: anElement [
	self viewModel addTab: anElement viewModel
]

{ #category : #'api - adding / removing' }
BrTabGroup >> addTab: anElement at: anInteger [ 
	self viewModel addTab: anElement viewModel at: anInteger
]

{ #category : #'api - adding / removing' }
BrTabGroup >> addTabs: aCollectionOfElements [
	self viewModel addTabs: (aCollectionOfElements collect: [ :anElement | anElement viewModel])
]

{ #category : #accessing }
BrTabGroup >> content [
	^ self childNamed: #content
]

{ #category : #'api - testing' }
BrTabGroup >> hasTab: anElement [
	^ self viewModel hasTab: anElement viewModel
]

{ #category : #initialization }
BrTabGroup >> initialize [
	super initialize.

	self viewModel: (BrTabGroupModel new +
		(BrInteractiveModel withAll: {
			BrLayoutHorizontalResizerModel matchParent.
			BrLayoutVerticalResizerModel matchParent }))
]

{ #category : #'api - adding / removing' }
BrTabGroup >> removeTab: anElement [
	self viewModel removeTab: anElement viewModel
]
