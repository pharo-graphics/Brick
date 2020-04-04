"
I add API that allows users to enable/disable widgets that support it, for example ${class:BrButton}$ or ${class:BrToggle}$
"
Trait {
	#name : #TBrEnableable,
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - activation' }
TBrEnableable >> disable [
	self dispatchEvent: (BrEnablementWish activated: false)
]

{ #category : #'api - activation' }
TBrEnableable >> enable [
	self dispatchEvent: (BrEnablementWish activated: true)
]

{ #category : #'api - activation' }
TBrEnableable >> enabled: aBoolean [
	aBoolean
		ifTrue: [ self enable ]
		ifFalse: [ self disable ]
]

{ #category : #'api - activation' }
TBrEnableable >> isDisabled [	
	^ self isEnabled not
]

{ #category : #'api - activation' }
TBrEnableable >> isEnabled [ 	
	^ (self viewModel request: BrEnablementRequest oneWay) isEnabled
]
