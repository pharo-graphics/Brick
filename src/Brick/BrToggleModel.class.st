Class {
	#name : #BrToggleModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'activated',
		'label',
		'icon',
		'oneWay'
	],
	#category : 'Brick-Toggle - Model'
}

{ #category : #'api - toggle' }
BrToggleModel >> activate [
	self isActivated
		ifTrue: [ ^ self ].

	activated := true.
	self notifyToggleActivated
]

{ #category : #'api - toggle' }
BrToggleModel >> activated: aBoolean [
	aBoolean
		ifTrue: [ self activate ]
		ifFalse: [ self deactivate ]
]

{ #category : #'api - toggle' }
BrToggleModel >> beOneWay [
	"One way toggle can only be activated as a result of click,
	however it can be deactivated programmatically.
	One way toggles are used within a toggle group"
	oneWay := true
]

{ #category : #'mouse handlers' }
BrToggleModel >> clickEvent: anEvent [
	anEvent consumed: true.
	
	self activated: (oneWay or: [ self isActivated not ])
]

{ #category : #'api - toggle' }
BrToggleModel >> deactivate [
	self isActivated
		ifFalse: [ ^ self ].

	activated := false.
	self notifyToggleDeactivated
]

{ #category : #printing }
BrToggleModel >> gtDisplayOn: aStream [
	aStream nextPutAll: self label
]

{ #category : #'api - widget' }
BrToggleModel >> icon [
	<return: #BlElement>

	^ icon
]

{ #category : #'api - widget' }
BrToggleModel >> icon: aBlElement [
	icon := aBlElement.
	self notifyIconChanged
]

{ #category : #initialization }
BrToggleModel >> initialize [
	super initialize.

	label := 'Toggle'.
	icon := (BlEllipse radius: 5) asElement.
	activated := false.
	oneWay := false
]

{ #category : #testing }
BrToggleModel >> isActivated [
	<return: #Boolean>

	^ activated
]

{ #category : #testing }
BrToggleModel >> isEnabled [
	^ true
]

{ #category : #testing }
BrToggleModel >> isOneWay [
	"Return true if I am one way toggle - I can not be deactivated as a result of a click, only programmatically"
	<return: #Boolean>
	
	^ oneWay
]

{ #category : #'api - widget' }
BrToggleModel >> label [
	<return: #BlText or: #String>

	^ label
]

{ #category : #'api - widget' }
BrToggleModel >> label: aBrTextOrString [
	label := aBrTextOrString.
	self notifyLabelChanged
]

{ #category : #notifying }
BrToggleModel >> notifyIconChanged [
	self dispatchEvent: (BrIconChanged new icon: self icon)
]

{ #category : #notifying }
BrToggleModel >> notifyLabelChanged [
	self dispatchEvent: (BrLabelChanged new text: self label)
]

{ #category : #notifying }
BrToggleModel >> notifyToggleActivated [
	self fireEvent: (BrToggleActivatedEvent toggle: self)
]

{ #category : #notifying }
BrToggleModel >> notifyToggleDeactivated [
	self fireEvent: (BrToggleDeactivatedEvent toggle: self)
]

{ #category : #hooks }
BrToggleModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	self when: BrLabelRequest reply: [ BrLabelChanged new text: self label ].
	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ].
	
	self when: BrToggleStateRequest do: [
		self isActivated
			ifTrue: [ BrToggleActivatedEvent toggle: self ]
			ifFalse: [ BrToggleDeactivatedEvent toggle: self ] ].

	self when: BrToggleStateRequest do: [
		self isEnabled
			ifTrue: [ BrToggleEnabledEvent toggle: self ]
			ifFalse: [ BrToggleDisabledEvent toggle: self ] ]
]

{ #category : #printing }
BrToggleModel >> printOn: aStream [
	aStream nextPutAll: self label
]

{ #category : #'api - toggle' }
BrToggleModel >> toggle [
	self activated: self isActivated not
]
