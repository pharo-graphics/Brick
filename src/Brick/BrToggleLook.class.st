Class {
	#name : #BrToggleLook,
	#superclass : #BrLook,
	#category : 'Brick-Toggle - Look'
}

{ #category : #initialization }
BrToggleLook >> initialize [
	super initialize.
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					self toggleDeactivated.
					self toggleEnabled ];
				down: [ :e |  ];
				yourself)
]

{ #category : #initialization }
BrToggleLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrToggleActivatedEvent do: [ self toggleActivated ].
	self when: BrToggleDeactivatedEvent do: [ self toggleDeactivated ]
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
