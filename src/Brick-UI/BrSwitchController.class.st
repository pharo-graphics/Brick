Class {
	#name : #BrSwitchController,
	#superclass : #BrButtonBaseController,
	#category : 'Brick-UI-Switch'
}

{ #category : #'as yet unclassified' }
BrSwitchController >> isChecked [
	^ self hasActiveState: BlCheckedState
]

{ #category : #'as yet unclassified' }
BrSwitchController >> onMouseUp: anEvent [
	self toggleState: BlCheckedState.
	widget checked: self isChecked.
	self onStateChanged.
	^ super onMouseUp: anEvent
]

{ #category : #'as yet unclassified' }
BrSwitchController >> wantsEvent: anEvent [
	(anEvent isMouse or: [ anEvent isBaseDrag ])
		ifTrue: [ ^ true ].
	^ super wantsEvent: anEvent
]
