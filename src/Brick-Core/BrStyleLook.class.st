Class {
	#name : #BrStyleLook,
	#superclass : #BrLook,
	#traits : 'TBlElementStyles + TBlElementQuery',
	#classTraits : 'TBlElementStyles classTrait + TBlElementQuery classTrait',
	#instVars : [
		'styles',
		'target'
	],
	#category : #'Brick-Core-Core'
}

{ #category : #'private - adding' }
BrStyleLook >> basicAddStyle: aStyle [
	styles basicAddStyle: aStyle
]

{ #category : #'private - adding' }
BrStyleLook >> for: aTargetObject [
	^ styles for: aTargetObject
]

{ #category : #initialization }
BrStyleLook >> initialize [
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
BrStyleLook >> propagateStylesToWidget [
	"Call me if this look is updated after its creation"

	self widgetDo: [ :aWidget |
		aWidget style addStyles: styles styles.
		aWidget requestStyle ]
]

{ #category : #accessing }
BrStyleLook >> queryStep: aBlElementStep [
	target queryStep: aBlElementStep
]

{ #category : #accessing }
BrStyleLook >> state [
	^ BlElementState
]

{ #category : #'private - adding' }
BrStyleLook >> styleForState: aState ifFound: aFoundBlock ifNone: aNoneBlock [
	^ styles
		styleForState: aState
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]

{ #category : #accessing }
BrStyleLook >> target: aSelectorPath [	
	self deprecated: 'Use Element Query Api instead'.
]

{ #category : #'private - adding' }
BrStyleLook >> when: aStateBlock style: aStyleBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	aStyleBlock value: (self styleFor: aTargetState)
]
