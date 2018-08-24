Class {
	#name : #BrToggleButtonController,
	#superclass : #BrButtonBaseController,
	#category : 'Brick-UI-Toggle'
}

{ #category : #'as yet unclassified' }
BrToggleButtonController >> initializeController [
	super initializeController.
	
	widget selectedProperty onChangedDo: [ :v | 
			v
				ifTrue: [ self activateState: BlSelectedState ]
				ifFalse: [ self deactivateState: BlSelectedState ] ]
]

{ #category : #'as yet unclassified' }
BrToggleButtonController >> isSelected [
	^ self hasActiveState: BlSelectedState
]

{ #category : #'as yet unclassified' }
BrToggleButtonController >> onMouseUp: anEvent [
	self activateState: BlSelectedState.
	 widget selected: self isSelected.
	self onStateChanged.
	^ super onMouseUp: anEvent
]
