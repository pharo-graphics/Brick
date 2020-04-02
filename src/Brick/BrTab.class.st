Class {
	#name : #BrTab,
	#superclass : #BlElement,
	#traits : 'TBrLayoutAlignable + TBrLayoutResizable',
	#classTraits : 'TBrLayoutAlignable classTrait + TBrLayoutResizable classTrait',
	#instVars : [
		'labelModel',
		'iconModel'
	],
	#category : #'Brick-Tabs - UI'
}

{ #category : #'api - accessing' }
BrTab >> actionbarStencil: anActionbarStencilBuilder [
	"See ${method:BrTabModel>>#actionbarStencil:}"

	self viewModel actionbarStencil: anActionbarStencilBuilder
]

{ #category : #'api - accessing' }
BrTab >> actionsStencil: anActionStencilBuilder [
	self
		deprecated: 'Please use #toolbarStencil: instead'
		transformWith: '`@receiver actionsStencil:: `@statements1' 
						-> '`@receiver toolbarStencil: `@statements1'.
	
	self toolbarStencil: anActionStencilBuilder
]

{ #category : #'api - selection' }
BrTab >> deselect [
	self dispatchEvent: (BrSelectedWish selected: false)
]

{ #category : #'api - accessing' }
BrTab >> icon [
	<return: #BlElement>

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
			BrSizeAdjustmentModel new.
			BrLayoutHorizontalResizerModel fitContent.
			BrLayoutVerticalResizerModel fitContent
	}))
]

{ #category : #'api - accessing' }
BrTab >> label [
	<return: #BlText>

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

{ #category : #'api - selection' }
BrTab >> selected: aBoolean [
	self viewModel selected: aBoolean
]

{ #category : #'api - accessing' }
BrTab >> stencil: aStencilBuilder [
	self viewModel stencil: aStencilBuilder
]

{ #category : #'api - accessing' }
BrTab >> toolbarStencil: aToolbarStencilBuilder [
	"See ${method:BrTabModel>>#toolbarStencil:}"

	self viewModel toolbarStencil: aToolbarStencilBuilder
]
