Class {
	#name : #BrTabAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Tabs - Look'
}

{ #category : #initialization }
BrTabAptitude >> initializeListeners [
	super initializeListeners.
	
	self
		when: BrTabSelectedEvent
		do: [ :anEvent | self onTabSelected: anEvent tab ].
	self
		when: BrTabDeselectedEvent
		do: [ :anEvent | self onTabDeselected: anEvent tab ].
]

{ #category : #hooks }
BrTabAptitude >> onTabDeselected: aBrTabModel [ 
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab deselected event without being attached to a widget' ].

	self widget states removeState: BlElementState selected
]

{ #category : #hooks }
BrTabAptitude >> onTabSelected: aTabModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab selected event without being attached to a widget' ].

	self widget states addState: BlElementState selected
]
