Class {
	#name : #BrControllerOld,
	#superclass : #Object,
	#instVars : [
		'widget',
		'keyBindings'
	],
	#category : 'Brick-Old'
}

{ #category : #'state management' }
BrControllerOld >> activateState: aState [
	(self hasActiveState: aState)
		ifTrue: [ ^ self ].
	self states add: aState.
]

{ #category : #'state management' }
BrControllerOld >> deactivateState: aState [
	(self hasActiveState: aState)
		ifFalse: [ ^ self ].
	self states remove: aState
]

{ #category : #'state management' }
BrControllerOld >> hasActiveState: aState [
	^ self states includes: aState
]

{ #category : #initialization }
BrControllerOld >> initialize [
	super initialize.
	keyBindings := BlShortcutRegistry new
]

{ #category : #initialization }
BrControllerOld >> initializeController [
	widget addEventHandler: (BlEventHandler on: BlKeyDownEvent do: [ :e |  self performActionForEvent: e ]).
	widget disabledProperty onChangedDo: [ :v | self toggleState: BlDisabledState ]
]

{ #category : #'key bindings' }
BrControllerOld >> initializeKeyBindings [
]

{ #category : #accessing }
BrControllerOld >> keyBindings [
	^ keyBindings
]

{ #category : #'event handling' }
BrControllerOld >> onBlur: anEvent [
	"Is sent when widget loses focus"
]

{ #category : #'event handling' }
BrControllerOld >> onFocus: anEvent [
	
]

{ #category : #installation }
BrControllerOld >> onInstalledIn: aWidget [
	widget := aWidget.
	self initializeKeyBindings.
	self initializeController
]

{ #category : #'event handling' }
BrControllerOld >> onMouseDown: anEvent [
	
]

{ #category : #'event handling' }
BrControllerOld >> onMouseEnter: anEvent [
	
]

{ #category : #'event handling' }
BrControllerOld >> onMouseLeave: anEvent [
	
]

{ #category : #'event handling' }
BrControllerOld >> onMouseUp: anEvent [
	
]

{ #category : #'state management' }
BrControllerOld >> onStateChanged [
	 widget dispatchEvent: (BrElementStateChangedEvent target: widget)
]

{ #category : #installation }
BrControllerOld >> onUninstalledIn: aWidget [
	widget := nil
	
]

{ #category : #'key bindings' }
BrControllerOld >> performActionForEvent: anEvent [
	(keyBindings keyBindingForEvent: anEvent) ifNotNil: [ :kb | 
			anEvent consumed: true.
			self perform: kb action ]
]

{ #category : #'state management' }
BrControllerOld >> states [
	^ widget pseudoClassStates
]

{ #category : #'state management' }
BrControllerOld >> toggleState: aState [
	(self hasActiveState: aState)
		ifTrue: [ self deactivateState: aState ]
		ifFalse: [ self activateState: aState ].
]

{ #category : #events }
BrControllerOld >> wantsEvent: anEvent [
	^ false
]
