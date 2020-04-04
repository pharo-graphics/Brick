"
I add API that allows users to enable/disable widgets that support it, for example ${class:BrButton}$ or ${class:BrToggle}$
"
Trait {
	#name : #TBrDisableable,
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - activation' }
TBrDisableable >> disable [
	self dispatchEvent: (BrEnablementWish activated: false)
]

{ #category : #'api - activation' }
TBrDisableable >> enable [
	self dispatchEvent: (BrEnablementWish activated: true)
]

{ #category : #'api - activation' }
TBrDisableable >> enabled: aBoolean [
	aBoolean
		ifTrue: [ self enable ]
		ifFalse: [ self disable ]
]

{ #category : #'api - activation' }
TBrDisableable >> isDisabled [	
	^ self isEnabled not
]

{ #category : #'api - activation' }
TBrDisableable >> isEnabled [ 	
	^ (self viewModel request: BrEnablementRequest oneWay) enabled
]
