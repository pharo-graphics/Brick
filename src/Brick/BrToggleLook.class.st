Class {
	#name : #BrToggleLook,
	#superclass : #BrLook,
	#category : 'Brick-Toggle - Look'
}

{ #category : #initialization }
BrToggleLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrToggleActivatedEvent do: [ self toggleActivated ].
	self when: BrToggleDeactivatedEvent do: [ self toggleDeactivated ]
]

{ #category : #initialization }
BrToggleLook >> initializeLook [
	super initializeLook.
	
	self toggleDeactivated.
	self toggleEnabled
]

{ #category : #initialization }
BrToggleLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrToggleStateRequest new
]

{ #category : #'event handling' }
BrToggleLook >> toggleActivated [
]

{ #category : #'event handling' }
BrToggleLook >> toggleDeactivated [
]

{ #category : #'event handling' }
BrToggleLook >> toggleDisabled [
]

{ #category : #'event handling' }
BrToggleLook >> toggleEnabled [
]
