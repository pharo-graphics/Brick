Class {
	#name : #BrFocusModel,
	#superclass : #BrStateModel,
	#instVars : [
		'focused'
	],
	#category : #'Brick-! Core'
}

{ #category : #'focus handlers' }
BrFocusModel >> focusInEvent: anEvent [	
		
	self isFocused
		ifTrue: [ ^ self ].
		
	focused := true.
	self notifyStateChanged: focused
]

{ #category : #'focus handlers' }
BrFocusModel >> focusOutEvent: anEvent [

	self isFocused
		ifFalse: [ ^ self ].
		
	focused := false.
	self notifyStateChanged: focused
]

{ #category : #initialization }
BrFocusModel >> initialize [
	super initialize.
	
	focused := false
]

{ #category : #initialization }
BrFocusModel >> initializeListeners [
	super initializeListeners.
	
	self when: BlFocusInEvent do: [ :anEvent | self focusInEvent: anEvent ].
	self when: BlFocusOutEvent do: [ :anEvent | self focusOutEvent: anEvent ]
]

{ #category : #'api - testing' }
BrFocusModel >> isFocused [
	<return: #Boolean>

	^ focused
]

{ #category : #streaming }
BrFocusModel >> stateChangedEventClass [
	^ BrFocusedChanged
]

{ #category : #streaming }
BrFocusModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (self isFocused
			ifTrue: [ BrFocusedState new ]
			ifFalse: [ BrFocusedState new not ])
		model: self
]
