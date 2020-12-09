"
I am a model for expandable / collapsable widgets.

Users can send me a ${class:BrExpansionStateRequest}$ to know whether I am expanded or collapses. 
"
Class {
	#name : #BrExpandableModel,
	#superclass : #BrStateModel,
	#instVars : [
		'expanded'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrExpandableModel class >> isDeprecated [
	^ true
]

{ #category : #'api - expandable' }
BrExpandableModel >> collapse [
	self expanded: false
]

{ #category : #'api - expandable' }
BrExpandableModel >> expand [
	self expanded: true
]

{ #category : #'api - expandable' }
BrExpandableModel >> expanded: aBoolean [
	expanded = aBoolean
		ifTrue: [ ^ self ].
		
	expanded := aBoolean.
	self notifyExpansionChanged.
	self notifyStateChanged: expanded
]

{ #category : #initialization }
BrExpandableModel >> initialize [
	super initialize.
	
	expanded := false
]

{ #category : #initialization }
BrExpandableModel >> initializeListeners [
	super initializeListeners.

	self when: BrExpansionStateRequest reply: [ :aResponse | aResponse expanded: self isExpanded ].
	self when: BrExpansionWish do: [ :aWish | self expanded: aWish isExpanded ].
	self when: BrExpansionToggleWish do: [ self toggle ]
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
	self dispatchEvent: (self isExpanded
		ifTrue: [ BrExpandedEvent new ]
		ifFalse: [ BrCollapsedEvent new ])
]

{ #category : #streaming }
BrExpandableModel >> stateChangedEventClass [
	^ BrExpansionChanged
]

{ #category : #streaming }
BrExpandableModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (self isExpanded 
			ifTrue: [ BrDeprecatedExpandedState new ]
			ifFalse: [ BrDeprecatedExpandedState new not ])
		model: self
]

{ #category : #'api - expandable' }
BrExpandableModel >> toggle [
	self expanded: self isExpanded not
]
