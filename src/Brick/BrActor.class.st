Class {
	#name : #BrActor,
	#superclass : #BlElementEventListener,
	#traits : 'TBlEventTarget',
	#classTraits : 'TBlEventTarget classTrait',
	#instVars : [
		'eventDispatcher',
		'widget',
		'actors'
	],
	#category : 'Brick-! Core'
}

{ #category : #accessing }
BrActor >> children [
	^ actors
]

{ #category : #'event management' }
BrActor >> dispatchEvent: anEvent [
	"I only call my event dispatcher, so the event can be only handled by my event handlers/filters"
	"we should not dispatch an event that was sent by me"

	anEvent hasSource
		ifFalse: [ anEvent source: self ].

	"first, we dispatch to my direct listeners"
	self dispatchEventToMyself: anEvent.

	"then let the rest of the element components receive it"
	self isAttachedToWidget
		ifTrue: [ self dispatchEventToWidget: anEvent ]
		ifFalse: [ self handleEvent: anEvent ]
]

{ #category : #'event management' }
BrActor >> dispatchEventToMyself: anEvent [

	anEvent forwardingTarget: self.
	anEvent target: self.

	(self eventDispatcher wantsEvent: anEvent)
		ifTrue: [ self eventDispatcher dispatchEvent: anEvent ].
		
	anEvent sendTo: self
]

{ #category : #'event management' }
BrActor >> dispatchEventToWidget: anEvent [

	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I must be attached to a widget to dispatch event' ].

	"anEvent forwardingTarget: self."
	self widget dispatchEvent: anEvent
]

{ #category : #'event management accessing' }
BrActor >> eventDispatcher [
	"Return an object responsible for event dispatching"
	<return: #BlDirectEventDispatcher>

	^ eventDispatcher
]

{ #category : #'event management' }
BrActor >> fireEvent: anEvent [
	"I fire provided event building an event dispatcher chain
	(from target to the root element) and dispatch the event with it.
	anEvent must not be nil"

	anEvent hasSource
		ifFalse: [ anEvent source: self ].

	"first, we fire to my direct listeners"
	self fireEventToMyself: anEvent.

	"then let the rest of the element components receive it"
	self isAttachedToWidget
		ifTrue: [ self widget fireEvent: anEvent ]
]

{ #category : #'event management' }
BrActor >> fireEventToMyself: anEvent [
	
	anEvent forwardingTarget: self.
	anEvent target: self.

	BlEvent fireEvent: anEvent target: self
]

{ #category : #'gt-inspector-extension' }
BrActor >> gtInspectorChildrenIn: aComposite [
	<gtInspectorPresentationOrder: 80>

	^ aComposite fastList
		title: 'Children';
		display: [ self children ];
		when: [ self children isNotEmpty ]
]

{ #category : #'gt-inspector-extension' }
BrActor >> gtInspectorFiltersIn: aComposite [
	<gtInspectorPresentationOrder: 80>

	self eventDispatcher gtInspectorFiltersIn: aComposite
]

{ #category : #'gt-inspector-extension' }
BrActor >> gtInspectorHandlersIn: aComposite [
	<gtInspectorPresentationOrder: 80>

	self eventDispatcher gtInspectorHandlersIn: aComposite
]

{ #category : #'event handling' }
BrActor >> handleEvent: anEvent [
	| aCurrentTarget aTarget |
	
	self children do: [ :aWidgetModel | aWidgetModel handleEvent: anEvent ].

	"do not handle outgoing events"
	(anEvent source == self)
		ifTrue: [ ^ self ].

	"We should restore current event target after forwarding "
	aCurrentTarget := anEvent currentTarget.
	aTarget := anEvent target.
	[ self dispatchEventToMyself: anEvent ]
		ensure: [
			anEvent currentTarget: aCurrentTarget.
			anEvent target: aTarget ]
]

{ #category : #testing }
BrActor >> hasOwner [
	"Utility #owner message makes it possible to have a polymorphic way to visualise a tree structure of the elements"
	<return: #Boolean>

	^ self isAttachedToWidget
]

{ #category : #initialization }
BrActor >> initialize [
	super initialize.

	eventDispatcher := BlDirectEventDispatcher on: self.
	actors := OrderedCollection new.
	
	self initializeListeners
]

{ #category : #initialization }
BrActor >> initializeListeners [
]

{ #category : #'api - testing' }
BrActor >> isAttachedToWidget [
	<return: #Boolean>

	^ widget isNotNil
]

{ #category : #accessing }
BrActor >> owner [
	"Utility #owner message makes it possible to have a polymorphic way to visualise a tree structure of the elements"
	<return: #BlElement>

	^ self widget
]

{ #category : #'event management' }
BrActor >> request: aBrRequest [
	self dispatchEvent: aBrRequest
]

{ #category : #'event management' }
BrActor >> requestWithResponse: aBrRequest [

	self dispatchEvent: aBrRequest.
	^ aBrRequest response
]

{ #category : #accessing }
BrActor >> widget [
	<return: #BlElement>
	
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'Must be attached to a widget in order to access it' ].

	^ widget
]

{ #category : #accessing }
BrActor >> widgetDo: aBlockClosure [
	widget ifNotNil: aBlockClosure
]
