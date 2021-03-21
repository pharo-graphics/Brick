Class {
	#name : #BrToggleState,
	#superclass : #BlElementUniqueState,
	#category : #'Brick-Toggle - States'
}

{ #category : #'instance creation' }
BrToggleState class >> activated [
	^ BrToggleActivatedState uniqueInstance
]

{ #category : #'instance creation' }
BrToggleState class >> deactivated [
	^ BrToggleDeactivatedState uniqueInstance
]

{ #category : #testing }
BrToggleState >> isActivated [
	^ false
]

{ #category : #testing }
BrToggleState >> isDeactivated [
	^ false
]

{ #category : #accessing }
BrToggleState >> priority [
	^ UserPriority
]

{ #category : #accessing }
BrToggleState >> type [
	"Return an object used to compare two states when adding to the collection of states in order to prevent
	elements from having duplicated states"
	<return: #Object>

	^ BrToggleState
]
