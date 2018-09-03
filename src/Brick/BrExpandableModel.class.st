"
I am a model for expandable / collapsable widgets
"
Class {
	#name : #BrExpandableModel,
	#superclass : #BrStateModel,
	#instVars : [
		'expanded'
	],
	#category : #'Brick-! Core'
}

{ #category : #'api - expandable' }
BrExpandableModel >> collapse [
	self isCollapsed
		ifTrue: [ ^ self ].

	expanded := false.
	self notifyExpansionChanged
]

{ #category : #'api - expandable' }
BrExpandableModel >> expand [
	self isExpanded
		ifTrue: [ ^ self ].

	expanded := true.
	self notifyExpansionChanged
]

{ #category : #'api - expandable' }
BrExpandableModel >> expanded: aBoolean [
	aBoolean
		ifTrue: [ self expand ]
		ifFalse: [ self collapse ]
]

{ #category : #initialization }
BrExpandableModel >> initialize [
	super initialize.
	
	expanded := false
]

{ #category : #initialization }
BrExpandableModel >> initializeListeners [
	super initializeListeners.

	self when: BrExpandedRequest reply: [ :aResponse | aResponse expanded: self isExpanded ]
]

{ #category : #'api - testing' }
BrExpandableModel >> isCollapsed [
	<return: #Boolean>
	
	^ expanded not
]

{ #category : #'api - testing' }
BrExpandableModel >> isExpanded [
	<return: #Boolean>
	
	^ expanded
]

{ #category : #notifying }
BrExpandableModel >> notifyExpansionChanged [
	self dispatchEvent: (self stateChangedEventClass expanded: self isExpanded)
]

{ #category : #streaming }
BrExpandableModel >> stateChangedEventClass [
	^ BrExpansionChanged
]

{ #category : #streaming }
BrExpandableModel >> streamStateOn: aStream [
	self isExpanded 
		ifTrue: [ aStream nextPut: BrExpandedState new ]
		ifFalse: [ aStream nextPut: BrExpandedState new not ]
]

{ #category : #'api - expandable' }
BrExpandableModel >> toggle [
	self expanded: self isExpanded not
]
