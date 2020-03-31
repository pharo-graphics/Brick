Class {
	#name : #BrActor,
	#superclass : #Object,
	#traits : 'TBlEventTarget',
	#classTraits : 'TBlEventTarget classTrait',
	#instVars : [
		'widget',
		'actors',
		'eventDispatcher'
	],
	#category : #'Brick-! Core'
}

{ #category : #accessing }
BrActor >> actors [
	<return: #Collection of: #BrActor>

	^ self children
]

{ #category : #'event management' }
BrActor >> addEventHandler: anEventHandler [
	self isAttachedToWidget
		ifTrue: [ self widget addEventHandler: (BlEventForwarder forwardTo: anEventHandler from: self) ]
		ifFalse: [ self eventDispatcher addEventHandler: anEventHandler ]
]

{ #category : #accessing }
BrActor >> allActorsBreadthFirstDo: aBlock [ 
	self actors do: aBlock.
	self actors do: [ :each | each allActorsBreadthFirstDo: aBlock ]
]

{ #category : #accessing }
BrActor >> allActorsDepthFirstDo: aBlock [
	self actors do: [ :each | each allActorsDepthFirstDo: aBlock ].
	self actors do: aBlock
]

{ #category : #accessing }
BrActor >> allChildren [
	<return: #Collection of: #BrActor>

	^ Array streamContents: [ :aStream |
		self children do: [ :each |
			aStream nextPut: each.
			aStream nextPutAll: each allChildren ] ]
]

{ #category : #accessing }
BrActor >> children [
	<return: #Collection of: #BrActor>

	^ actors
]

{ #category : #'event management' }
BrActor >> dispatchEvent: anEvent [
	"If I am attached to the widget I dispatch event to the widget,
	otherwise I dispatch a given event to myself and my children "

	anEvent hasSource
		ifFalse: [ anEvent source: self ].

	"first, we dispatch to my direct listeners"
	self dispatchEventToMyself: anEvent.

	"then let the rest of the element components receive it"
	self isAttachedToWidget
		ifTrue: [ self widget dispatchEvent: anEvent ]
		ifFalse: [ self children do: [ :anActor | anActor dispatchEvent: anEvent ] ]
]

{ #category : #'event management' }
BrActor >> dispatchEventToMyself: anEvent [

	anEvent target: self.
	anEvent forwardingTarget: self.

	(self eventDispatcher wantsEvent: anEvent)
		ifTrue: [ self eventDispatcher dispatchEvent: anEvent ]
]

{ #category : #'event management accessing' }
BrActor >> eventDispatcher [
	"Return an object responsible for event dispatching"
	<return: #BlDirectEventDispatcher>

	^ eventDispatcher
]

{ #category : #accessing }
BrActor >> findActor: anActorClass [
	<return: #BrActor>
	
	^ self
		findActor: anActorClass
		ifFound: #yourself
		ifNone: [ self error: 'Actor of type ', anActorClass name, ' is not found' ]
]

{ #category : #accessing }
BrActor >> findActor: anActorClass ifFound: aFoundBlock [
	"Return an actor that corresponds to a given class.
	Throw error if it is not found"
	
	self class = anActorClass
		ifTrue: [ ^ aFoundBlock value: self ].

	self actors do: [ :eachActor | eachActor findActor: anActorClass ifFound: [ :anActor | ^ aFoundBlock value: anActor ] ].
]

{ #category : #accessing }
BrActor >> findActor: anActorClass ifFound: aFoundBlock ifNone: aNoneBlock [
	"Return an actor that corresponds to a given class.
	Throw error if it is not found"
	
	self
		findActor: anActorClass
		ifFound: [ :anActor | ^ aFoundBlock value: anActor ].
	
	^ aNoneBlock value
]

{ #category : #'event management' }
BrActor >> fireEvent: anEvent [
	"I fire provided event while building an event dispatcher chain
	(from target to the root element) and dispatch the event with it.
	anEvent must not be nil"

	anEvent hasSource
		ifFalse: [ anEvent source: self ].

	"first, we fire to my direct listeners"
	self fireEventToMyself: anEvent.

	"then let the rest of the element components receive it"
	self isAttachedToWidget
		ifTrue: [ self widget fireEvent: anEvent ]
		ifFalse: [ self children do: [ :anActor | anActor fireEvent: anEvent ] ]
]

{ #category : #'event management' }
BrActor >> fireEventToMyself: anEvent [
	
	anEvent forwardingTarget: self.
	anEvent target: self.

	BlEvent fireEvent: anEvent target: self
]

{ #category : #'api - testing' }
BrActor >> hasActor: anActorClass [
	"Return true if I or any of my children is of the given type"
	<return: #Boolean>

	^ self class = anActorClass
		or: [ self actors anySatisfy: [ :eachActor | eachActor hasActor: anActorClass ] ]
]

{ #category : #'api - testing' }
BrActor >> hasOwner [
	"Utility #owner message makes it possible to have a polymorphic way to visualise a tree structure of the elements"
	<return: #Boolean>

	^ self isAttachedToWidget
]

{ #category : #initialization }
BrActor >> initialize [
	super initialize.
	
	eventDispatcher := BlDirectEventDispatcher on: self.
	actors := #().
	
	self initializeListeners
]

{ #category : #initialization }
BrActor >> initializeListeners [
	"Override me to initialize event listeners such as property updates from the view model"
]

{ #category : #'api - testing' }
BrActor >> isAttachedToWidget [
	"Return true if I am attached to a widget element, false otherwise.
	When an actor (look or model) is not attached to the element it can not send or receive events"
	<return: #Boolean>

	^ widget isNotNil
]

{ #category : #'api - hooks' }
BrActor >> onAttachedTo: anElement [
	"Is sent when I am added to an element (or to the other actor which is added to the element)"

	self
		assert: [ widget isNil ]
		description: [ 'Can not install the same look instance on multiple widgets' ].

	widget := anElement.
	
	self transferEventHandlersToWidget
]

{ #category : #'api - hooks' }
BrActor >> onInstalledIn: anElement [
	"Is sent when I am added to an element (or to the other actor which is added to the element)"

	self
		assert: [ widget isNil ]
		description: [ 'Can not install the same look instance on multiple widgets' ].

	widget := anElement.
	
	self transferEventHandlersToWidget
]

{ #category : #'api - hooks' }
BrActor >> onUninstalledIn: anElement [
	"Is sent when I am removed from an element (or from the other actor which was part of the element)"
	
	self removeEventHandlersFromWidget
]

{ #category : #accessing }
BrActor >> owner [
	"Utility #owner message makes it possible to have a polymorphic way to visualise a tree structure of the elements"
	<return: #BlElement>

	^ self widget
]

{ #category : #'private - event management' }
BrActor >> removeEventHandlersFromWidget [
	self widget removeEventHandlersSuchThat: [ :eachEventHandler |
		(eachEventHandler isKindOf: BlEventForwarder) and: [ eachEventHandler eventTarget == self ] ]
]

{ #category : #'event management' }
BrActor >> request: aBrRequest [

	aBrRequest canBePropagated
		ifTrue: [ self fireEvent: aBrRequest ]
		ifFalse: [ self dispatchEvent: aBrRequest ].

	^ aBrRequest response
]

{ #category : #'private - event management' }
BrActor >> transferEventHandlersToWidget [
	| theEventHandlers |
	
	theEventHandlers := self eventDispatcher handlers.
	self eventDispatcher removeEventHandlers.
	
	theEventHandlers do: [ :eachHandler | self widget addEventHandler: (BlEventForwarder forwardTo: eachHandler from: self) ]
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

{ #category : #accessing }
BrActor >> withAllActorsBreadthFirstDo: aBlock [
	aBlock value: self.
	self allActorsBreadthFirstDo: aBlock
]

{ #category : #accessing }
BrActor >> withAllActorsDepthFirstDo: aBlock [
	self allActorsDepthFirstDo: aBlock.
	aBlock value: self
]

{ #category : #accessing }
BrActor >> withAllChildren [
	<return: #Collection of: #BrActor>

	^ { self }, self allChildren
]
