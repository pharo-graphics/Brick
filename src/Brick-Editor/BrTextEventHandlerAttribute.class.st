"
I am an attribute with the ability to handle events received by a visual text element 
"
Class {
	#name : #BrTextEventHandlerAttribute,
	#superclass : #BrTextAttribute,
	#traits : 'TBlEventHandler',
	#classTraits : 'TBlEventHandler classTrait',
	#instVars : [
		'action'
	],
	#category : 'Brick-Editor-Text-Attributes'
}

{ #category : #comparing }
BrTextEventHandlerAttribute >> = anObject [
	^ self == anObject
]

{ #category : #accessing }
BrTextEventHandlerAttribute >> action [
	^ action
]

{ #category : #accessing }
BrTextEventHandlerAttribute >> action: aBlock [
	self 
		assert: [ aBlock notNil ] 
		description: [ 'Action should be initialized' ].
	action := aBlock
]

{ #category : #comparing }
BrTextEventHandlerAttribute >> equals: aTextAttribute [
	"Return true if I am equal to a given text attribute assuming that
	it has the same type as me"
	<return: #Boolean>

	^ self species = aTextAttribute species
]

{ #category : #events }
BrTextEventHandlerAttribute >> handleEvent: anEvent [
	"Handle a given event or dispatch it using #sendTo:"
	
	anEvent sendTo: self
]

{ #category : #comparing }
BrTextEventHandlerAttribute >> hash [
	^ self identityHash
]

{ #category : #initialization }
BrTextEventHandlerAttribute >> initialize [
	super initialize.
	self textAttributes: [ { BrTextForegroundAttribute paint: Color random paler } ].
]

{ #category : #testing }
BrTextEventHandlerAttribute >> isEventHandler [
	"Return true if attribute is designed to handle UI events such as mouse,
	false otherwise"
	<return: #Boolean>

	^ true
]

{ #category : #private }
BrTextEventHandlerAttribute >> performAction: anEvent [
	self action
		cull: anEvent currentTarget text
		cull: anEvent currentTarget
		cull: anEvent
]

{ #category : #accessing }
BrTextEventHandlerAttribute >> textAttribute: aTextAttributes [
	self 
		assert: [ aTextAttributes notNil ] 
		description: [ 'Text attribute has to be initialized' ].
	self textAttributes: { aTextAttributes }
]

{ #category : #accessing }
BrTextEventHandlerAttribute >> textAttributes: aCollectionOfTextAttributes [
	self 
		assert: [ aCollectionOfTextAttributes notNil ] 
		description: [ 'Text attributes have to be initialized' ].
	self action: [ :aText :anEventTarget :anEvent |
		aText attributes: aCollectionOfTextAttributes value ].
]

{ #category : #events }
BrTextEventHandlerAttribute >> wantsEvent: anEvent [
	"Return true if I am interested in a given event and want to handle it,
	false otherwise"
	<return: #Boolean>

	^ self subclassResponsibility
]
