Trait {
	#name : #TBrCheckable,
	#category : #'Brick-Checkbox - Support'
}

{ #category : #'api - checkbox' }
TBrCheckable >> check [
	self dispatchEvent: BrCheckboxWish checked
]

{ #category : #'api - checkbox' }
TBrCheckable >> indeterminate [
	self dispatchEvent: BrCheckboxWish indeterminate
]

{ #category : #'api - checkbox' }
TBrCheckable >> isChecked [
	^ (self viewModel request: BrCheckboxRequest new oneWay) isChecked
]

{ #category : #'api - checkbox' }
TBrCheckable >> isIndeterminate [
	^ (self viewModel request: BrCheckboxRequest new oneWay) isIndeterminate
]

{ #category : #'api - checkbox' }
TBrCheckable >> isUnchecked [
	^ (self viewModel request: BrCheckboxRequest new oneWay) isUnchecked
]

{ #category : #'api - checkbox' }
TBrCheckable >> uncheck [
	self dispatchEvent: BrCheckboxWish unchecked
]

{ #category : #'api - checkbox' }
TBrCheckable >> whenCheckedDo: aBlock [
	self when: BrCheckboxChanged do: [ :anEvent |
		anEvent isChecked
			ifTrue: [ aBlock cull: anEvent ] ]
]

{ #category : #'api - checkbox' }
TBrCheckable >> whenUncheckedDo: aBlock [
	self when: BrCheckboxChanged do: [ :anEvent |
		anEvent isUnchecked
			ifTrue: [ aBlock cull: anEvent ] ]
]
