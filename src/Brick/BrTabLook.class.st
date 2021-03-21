Class {
	#name : #BrTabLook,
	#superclass : #BrLook,
	#category : #'Brick-Tabs - Look'
}

{ #category : #initialization }
BrTabLook >> initializeListeners [
	super initializeListeners.
	
	self
		when: BrTabSelectedEvent
		do: [ :anEvent | self onTabSelected: anEvent tab ].
	self
		when: BrTabDeselectedEvent
		do: [ :anEvent | self onTabDeselected: anEvent tab ].
]

{ #category : #hooks }
BrTabLook >> onTabDeselected: aBrTabModel [ 
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab deselected event without being attached to a widget' ].

	self widget states removeState: BlElementState selected
]

{ #category : #hooks }
BrTabLook >> onTabSelected: aTabModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the tab selected event without being attached to a widget' ].

	self widget states addState: BlElementState selected
]
