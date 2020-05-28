"
I add API that allows users to enable/disable widgets that support it, for example ${class:BrButton}$ or ${class:BrToggle}$
"
Trait {
	#name : #TBrEnableable,
	#category : #'Brick-! Core - Support'
}

{ #category : #'api - enablement' }
TBrEnableable >> disable [
	self dispatchEvent: (BrEnablementWish enabled: false)
]

{ #category : #'api - enablement' }
TBrEnableable >> disabled: aBoolean [
	self enabled: aBoolean not
]

{ #category : #'api - enablement' }
TBrEnableable >> enable [
	self dispatchEvent: (BrEnablementWish enabled: true)
]

{ #category : #'api - enablement' }
TBrEnableable >> enabled: aBoolean [
	self dispatchEvent: (BrEnablementWish enabled: aBoolean)
]

{ #category : #'api - enablement' }
TBrEnableable >> isDisabled [	
	^ self isEnabled not
]

{ #category : #'api - enablement' }
TBrEnableable >> isEnabled [
	^ (self viewModel request: BrEnablementRequest new oneWay) isEnabled
]
