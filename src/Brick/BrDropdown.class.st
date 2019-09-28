Class {
	#name : #BrDropdown,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'expandedModel'
	],
	#category : #'Brick-Dropdown - UI'
}

{ #category : #'api - expansion' }
BrDropdown >> collapse [
	expandedModel collapse
]

{ #category : #'api - expansion' }
BrDropdown >> expand [
	expandedModel expand
]

{ #category : #initialization }
BrDropdown >> initialize [
	super initialize.
	
	self viewModel: (BrDropdownModel new
		addAll: { BrInteractiveModel new addStates: {
			expandedModel := BrExpandableModel new.
			BrLayoutHorizontalResizerModel fitContent.
			BrLayoutVerticalResizerModel fitContent } })
]

{ #category : #testing }
BrDropdown >> isExpanded [
	^ expandedModel isExpanded
]

{ #category : #'hooks - children' }
BrDropdown >> onRemovedFromSceneGraph [
	"Ensures that the dropdown state is reset to collapsed, which will remove dropdown decorators in space."

	super onRemovedFromSceneGraph.
	self collapse
]

{ #category : #'api - widget' }
BrDropdown >> popup: aBrStencil [
	self viewModel popupStencil: aBrStencil
]

{ #category : #'api - expansion' }
BrDropdown >> toggle [
	expandedModel toggle
]

{ #category : #'api - widget' }
BrDropdown >> toggle: aBrStencil [
	self viewModel toggleStencil: aBrStencil
]
