Class {
	#name : #BrPopup,
	#superclass : #BlElement,
	#instVars : [
		'expandedModel'
	],
	#category : #'Brick-Popup - UI'
}

{ #category : #initialization }
BrPopup >> initialize [
	super initialize.

	self viewModel: (BrPopupModel new
		addAll: { BrInteractiveModel new addState: (expandedModel := BrExpandableModel new) })
]
