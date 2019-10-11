Class {
	#name : #OLDBrDropdown,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'expandedModel'
	],
	#category : #'Brick-Dropdown - UI'
}

{ #category : #'api - expansion' }
OLDBrDropdown >> collapse [
	expandedModel collapse
]

{ #category : #'api - expansion' }
OLDBrDropdown >> expand [
	expandedModel expand
]

{ #category : #initialization }
OLDBrDropdown >> initialize [
	super initialize.
	
	self viewModel: (OLDBrDropdownModel new
		addAll: { BrInteractiveModel new addStates: {
			expandedModel := BrExpandableModel new.
			BrLayoutHorizontalResizerModel fitContent.
			BrLayoutVerticalResizerModel fitContent } })
]

{ #category : #testing }
OLDBrDropdown >> isExpanded [
	^ expandedModel isExpanded
]

{ #category : #'hooks - children' }
OLDBrDropdown >> onRemovedFromSceneGraph [
	"Ensures that the dropdown state is reset to collapsed, which will remove dropdown decorators in space."

	super onRemovedFromSceneGraph.
	self collapse
]

{ #category : #'api - widget' }
OLDBrDropdown >> popup: aBrStencil [
	self viewModel popupStencil: aBrStencil
]

{ #category : #'api - expansion' }
OLDBrDropdown >> toggle [
	expandedModel toggle
]

{ #category : #'api - widget' }
OLDBrDropdown >> toggle: aBrStencil [
	self viewModel toggleStencil: aBrStencil
]
