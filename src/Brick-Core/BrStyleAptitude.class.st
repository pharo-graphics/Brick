Class {
	#name : #BrStyleAptitude,
	#superclass : #BrAptitude,
	#traits : 'TBlElementStyles + TBlElementQuery',
	#classTraits : 'TBlElementStyles classTrait + TBlElementQuery classTrait',
	#instVars : [
		'styles',
		'target'
	],
	#category : #'Brick-Core-Core'
}

{ #category : #'private - adding' }
BrStyleAptitude >> basicAddStyle: aStyle [
	styles basicAddStyle: aStyle
]

{ #category : #'private - adding' }
BrStyleAptitude >> for: aTargetObject [
	^ styles for: aTargetObject
]

{ #category : #initialization }
BrStyleAptitude >> initialize [
	super initialize.

	styles := BlStyles new.

	"empty selector, means we apply it on the widget itself"
	target := BlElementLazyQuery new.

	self addChange:
		(BrLookChange new
			up: [ :thisLook |
				target isEmpty
					ifFalse: [ styles := styles asForwarded: target ].
				thisLook widget style addStyles: styles styles ];
			down: [ :thisLook | thisLook widget style removeStyles: styles styles ];
			yourself)
]

{ #category : #initialization }
BrStyleAptitude >> propagateStylesToWidget [
	"Call me if this look is updated after its creation"

	self widgetDo: [ :aWidget |
		aWidget style addStyles: styles styles.
		aWidget requestStyle ]
]

{ #category : #accessing }
BrStyleAptitude >> queryStep: aBlElementStep [
	target queryStep: aBlElementStep
]

{ #category : #accessing }
BrStyleAptitude >> state [
	^ BlElementState
]

{ #category : #'private - adding' }
BrStyleAptitude >> styleForState: aState ifFound: aFoundBlock ifNone: aNoneBlock [
	^ styles
		styleForState: aState
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #accessing }
BrStyleAptitude >> target: aSelectorPath [	
	self deprecated: 'Use Element Query Api instead'.
]

{ #category : #'private - adding' }
BrStyleAptitude >> when: aStateBlock style: aStyleBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	aStyleBlock value: (self styleFor: aTargetState)
]
