Trait {
	#name : #TBrActivatable,
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - activation' }
TBrActivatable >> disable [
	self dispatchEvent: (BrActivationWish activated: false)
]

{ #category : #'api - activation' }
TBrActivatable >> enable [
	self dispatchEvent: (BrActivationWish activated: true)
]

{ #category : #'api - activation' }
TBrActivatable >> enabled: aBoolean [
	aBoolean
		ifTrue: [ self enable ]
		ifFalse: [ self disable ]
]

{ #category : #'api - activation' }
TBrActivatable >> isDisabled [	
	^ self isEnabled not
]

{ #category : #'api - activation' }
TBrActivatable >> isEnabled [ 	
	^ (self viewModel request: BrActivationRequest oneWay) enabled
]
