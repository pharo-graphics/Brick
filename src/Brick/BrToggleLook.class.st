Class {
	#name : #BrToggleLook,
	#superclass : #BrStyleCommonLook,
	#category : #'Brick-Toggle - Look'
}

{ #category : #'api - style' }
BrToggleLook >> activated [
	^ self styleFor: BrToggleState activated
]

{ #category : #'api - style' }
BrToggleLook >> activated: aBlock [
	aBlock value: self activated
]

{ #category : #'api - style' }
BrToggleLook >> deactivated [
	^ self styleFor: BrToggleState deactivated
]

{ #category : #'api - style' }
BrToggleLook >> deactivated: aBlock [
	aBlock value: self deactivated
]

{ #category : #accessing }
BrToggleLook >> state [
	^ BrToggleState
]

{ #category : #'event handling' }
BrToggleLook >> toggleActivated [
]

{ #category : #'event handling' }
BrToggleLook >> toggleDeactivated [
]
