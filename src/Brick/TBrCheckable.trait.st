Trait {
	#name : #TBrCheckable,
	#category : #'Brick-Checkbox - Support'
}

{ #category : #'api - checkbox' }
TBrCheckable >> check [
	self states addState: BrCheckboxState checked
]

{ #category : #'api - checkbox' }
TBrCheckable >> checked: aBoolean [
	aBoolean
		ifTrue: [ self check ]
		ifFalse: [ self uncheck ]
]

{ #category : #'api - checkbox' }
TBrCheckable >> indeterminate [
	self states addState: BrCheckboxState indeterminate
]

{ #category : #'api - checkbox' }
TBrCheckable >> isChecked [
	^ self states hasState: BrCheckboxState checked
]

{ #category : #'api - checkbox' }
TBrCheckable >> isIndeterminate [
	^ self states hasState: BrCheckboxState indeterminate
]

{ #category : #'api - checkbox' }
TBrCheckable >> isUnchecked [
	^ self states hasState: BrCheckboxState unchecked
]

{ #category : #'api - checkbox' }
TBrCheckable >> uncheck [
	self states addState: BrCheckboxState unchecked
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
