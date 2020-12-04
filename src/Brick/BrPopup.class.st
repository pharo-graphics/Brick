"
[[[

popup := BrPopup new.
popup look: BrPopupLook new.
popup stencil: [ BlElement new background: Color red ].
popup target: BrPopupWindowTarget new.
popup show.

]]]
"
Class {
	#name : #BrPopup,
	#superclass : #BlElement,
	#traits : 'TBrLayoutResizable + TBrLayoutAlignable',
	#classTraits : 'TBrLayoutResizable classTrait + TBrLayoutAlignable classTrait',
	#instVars : [
		'expandedModel'
	],
	#category : #'Brick-Popup - UI'
}

{ #category : #'api - popup' }
BrPopup >> hide [
	expandedModel collapse
]

{ #category : #initialization }
BrPopup >> initialize [
	super initialize.

	self viewModel: (BrPopupModel new addAll: {
		BrInteractiveModel withAll: {
			BrLayoutAlignmentModel new } })
]

{ #category : #'api - popup' }
BrPopup >> show [
	expandedModel expand
]

{ #category : #accessing }
BrPopup >> stencil: aStencil [
	self viewModel stencil: aStencil
]

{ #category : #accessing }
BrPopup >> target: aPopupTarget [
	self viewModel target: aPopupTarget
]
