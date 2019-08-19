Class {
	#name : #BrTab,
	#superclass : #BlElement,
	#traits : 'TBrLayoutAlignable',
	#classTraits : 'TBrLayoutAlignable classTrait',
	#instVars : [
		'labelModel',
		'iconModel'
	],
	#category : #'Brick-Tabs - UI'
}

{ #category : #'api - accessing' }
BrTab >> actionsStencil: aStencilBuilder [
	self viewModel actionsStencil: aStencilBuilder
]

{ #category : #'api - selection' }
BrTab >> deselect [
	self dispatchEvent: (BrSelectedWish selected: false)
]

{ #category : #'api - accessing' }
BrTab >> icon [
	^ iconModel icon
]

{ #category : #'api - accessing' }
BrTab >> icon: anElement [
	iconModel icon: anElement
]

{ #category : #initialization }
BrTab >> initialize [
	super initialize.

	self viewModel: (BrTabModel new + 
		(labelModel := BrLabelModel new) +
		(iconModel := BrIconModel new) +
		(BrInteractiveModel withAll: {
			BrLayoutAlignmentModel new center.
			BrActivationModel new.
			BrPressModel new.
			BrHoverModel new.
			BrSelectModel new.
			BrDimensionModel new.
			BrLayoutHorizontalResizerModel fitContent.
			BrLayoutVerticalResizerModel fitContent
	}))
]

{ #category : #'api - accessing' }
BrTab >> label [
	^ labelModel text
]

{ #category : #'api - accessing' }
BrTab >> label: aStringOrText [
	labelModel text: aStringOrText
]

{ #category : #accessing }
BrTab >> parentTabGroup [
	^ self 
		allParentsDetect: [ :aParent | aParent isKindOf: BrTabGroup ]
		ifFound: [ :aParent | aParent ]
		ifNone: [ nil ]
]

{ #category : #'api - selection' }
BrTab >> select [
	self dispatchEvent: (BrSelectedWish selected: true)
]

{ #category : #'api - accessing' }
BrTab >> stencil: aStencilBuilder [
	self viewModel stencil: aStencilBuilder
]
