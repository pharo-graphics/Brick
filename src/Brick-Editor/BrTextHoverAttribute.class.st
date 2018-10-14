Class {
	#name : #BrTextHoverAttribute,
	#superclass : #BrTextEventHandlerAttribute,
	#instVars : [
		'leaveAction'
	],
	#category : 'Brick-Editor-Text-Attributes'
}

{ #category : #initialization }
BrTextHoverAttribute >> initialize [
	super initialize.
	self leaveTextAttribute: ( BlTextForegroundAttribute paint: Color black ).
]

{ #category : #accessing }
BrTextHoverAttribute >> leaveAction [
	^ leaveAction
]

{ #category : #accessing }
BrTextHoverAttribute >> leaveAction: aBlock [
	self 
		assert: [ aBlock notNil ] 
		description: [ 'Leave action should be initialized' ].
	leaveAction := aBlock
]

{ #category : #accessing }
BrTextHoverAttribute >> leaveTextAttribute: aTextAttributes [
	self 
		assert: [ aTextAttributes notNil ] 
		description: [ 'Text attribute has to be initialized' ].
	self leaveTextAttributes: { aTextAttributes }
]

{ #category : #accessing }
BrTextHoverAttribute >> leaveTextAttributes: aCollectionOfTextAttributes [
	self 
		assert: [ aCollectionOfTextAttributes notNil ] 
		description: [ 'Text attributes have to be initialized' ].
	self leaveAction: [ :aText :anEventTarget :anEvent |
		aText attributes: aCollectionOfTextAttributes value ].
]

{ #category : #'mouse handlers' }
BrTextHoverAttribute >> mouseEnterEvent: anEvent [
	self performAction: anEvent.
	anEvent currentTarget
		invalidate;
		requestLayout
]

{ #category : #'mouse handlers' }
BrTextHoverAttribute >> mouseLeaveEvent: anEvent [
	self performLeaveAction: anEvent.
	anEvent currentTarget 
		invalidate;
		requestLayout
]

{ #category : #private }
BrTextHoverAttribute >> performLeaveAction: anEvent [
	self leaveAction
		cull: anEvent currentTarget text
		cull: anEvent currentTarget
		cull: anEvent
]

{ #category : #accessing }
BrTextHoverAttribute >> removableTextAttribute: aTextAttribute [
	self 
		assert: [ aTextAttribute notNil ] 
		description: [ 'Text attribute has to be initialized' ].
	self removableTextAttributes: { aTextAttribute }
]

{ #category : #accessing }
BrTextHoverAttribute >> removableTextAttributes: aCollectionOfTextAttributes [
	| theUsedAttributes |
	self 
		assert: [ aCollectionOfTextAttributes notNil ] 
		description: [ 'Text attributes have to be initialized' ].
	self action: [ :aText :anEventTarget :anEvent |
		aText attributes: (theUsedAttributes := aCollectionOfTextAttributes value) ].
	self leaveAction: [ :aText :anEventTarget :anEvent |
		theUsedAttributes ifNotNil: [ :anInstance |
			aText clearAttributes: [ :aTextAttribute | anInstance includes: aTextAttribute ] ] ].
]

{ #category : #events }
BrTextHoverAttribute >> wantsEvent: anEvent [
	^ (anEvent isKindOf: BlMouseEnterEvent)
		or: [ anEvent isKindOf: BlMouseLeaveEvent ]
]
