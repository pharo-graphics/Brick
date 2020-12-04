Class {
	#name : #BrCheckboxState,
	#superclass : #BlElementUniqueState,
	#category : #'Brick-Checkbox - States'
}

{ #category : #'instance creation' }
BrCheckboxState class >> checked [
	^ BrCheckboxCheckedState uniqueInstance
]

{ #category : #'instance creation' }
BrCheckboxState class >> indeterminate [
	^ BrCheckboxIndeterminateState uniqueInstance
]

{ #category : #'instance creation' }
BrCheckboxState class >> unchecked [
	^ BrCheckboxUncheckedState uniqueInstance
]

{ #category : #enumerating }
BrCheckboxState >> optionalOnAddedTo: anElement [
	anElement dispatchEvent: (BrCheckboxChanged new state: self)
]

{ #category : #accessing }
BrCheckboxState >> priority [
	^ UserPriority
]

{ #category : #accessing }
BrCheckboxState >> type [
	"Return an object used to compare two states when adding to the collection of states in order to prevent
	elements from having duplicated states"
	<return: #Object>

	^ BrCheckboxState
]
