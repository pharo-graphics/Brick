Trait {
	#name : #TBrSwitchable,
	#category : #'Brick-Switch - Support'
}

{ #category : #'api - switch' }
TBrSwitchable >> isSwitchedOff [
	<return: #Boolean>
	
	^ (self viewModel request: BrSwitchRequest new oneWay) isOff
]

{ #category : #'api - switch' }
TBrSwitchable >> isSwitchedOn [
	<return: #Boolean>
	
	^ (self viewModel request: BrSwitchRequest new oneWay) isOn
]

{ #category : #'api - switch' }
TBrSwitchable >> switch: aBoolean [
	self dispatchEvent: (BrSwitchWish switchedOn: aBoolean)
]

{ #category : #'api - switch' }
TBrSwitchable >> switchOff [
	self dispatchEvent: (BrSwitchWish switchedOn: false)
]

{ #category : #'api - switch' }
TBrSwitchable >> switchOn [
	self dispatchEvent: (BrSwitchWish switchedOn: true)
]
