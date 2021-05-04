Class {
	#name : #BrToggleAptitude,
	#superclass : #BrStyleCommonAptitude,
	#category : #'Brick-Toggle - Look'
}

{ #category : #'api - style' }
BrToggleAptitude >> activated [
	^ self styleFor: BrToggleState activated
]

{ #category : #'api - style' }
BrToggleAptitude >> activated: aBlock [
	aBlock value: self activated
]

{ #category : #'api - style' }
BrToggleAptitude >> deactivated [
	^ self styleFor: BrToggleState deactivated
]

{ #category : #'api - style' }
BrToggleAptitude >> deactivated: aBlock [
	aBlock value: self deactivated
]

{ #category : #accessing }
BrToggleAptitude >> state [
	^ BrToggleState
]

{ #category : #'event handling' }
BrToggleAptitude >> toggleActivated [
]

{ #category : #'event handling' }
BrToggleAptitude >> toggleDeactivated [
]
