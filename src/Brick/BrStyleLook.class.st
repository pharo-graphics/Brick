Class {
	#name : #BrStyleLook,
	#superclass : #BrLook,
	#traits : 'TBlElementStyles',
	#classTraits : 'TBlElementStyles classTrait',
	#instVars : [
		'styles',
		'target'
	],
	#category : #'Brick-! Core - Looks'
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
	target := #().

	self addChange:
		(BrLookChange new
			up: [ :thisLook |
				self
					resolveStyleTargetStartingFrom: thisLook widget
					ifFound: [ :aStylesTarget |
						aStylesTarget = thisLook widget
							ifFalse: [ styles := styles asForwarded: aStylesTarget ].
						thisLook widget style addStyles: styles styles  ]
					ifNone: [ self error: ('Could not find an element for {1}' format: { target }) ].
				 ];
			down: [ :thisLook | thisLook widget style removeStyles: styles styles ];
			yourself)
]

{ #category : #'private - adding' }
BrStyleLook >> resolveStyleTargetStartingFrom: aWidgetElement ifFound: aFoundBlock ifNone: aNoneBlock [
	"Fidn the target element for the styles starting from an element to which this look is applied"
	<return: #BlElement>
	| aStyleTarget |

	aStyleTarget := self target
		inject: aWidgetElement
		into: [ :aCurrentElement :aCurrentId |
			aCurrentId isString
				ifTrue: [
					aCurrentElement
						childWithId: aCurrentId
						ifFound: [ :aNextChild | aNextChild ]
						ifNone: [ ^ aNoneBlock value ] ]
				ifFalse: [ aCurrentId ] ].

	^ aFoundBlock value: aStyleTarget
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
BrStyleLook >> target [
	^ target
]

{ #category : #accessing }
BrStyleLook >> target: aSelectorPath [
	"#(label)"
	
	target := aSelectorPath isString
		ifTrue: [ { aSelectorPath } ]
		ifFalse: [ aSelectorPath asArray ]
]

{ #category : #'private - adding' }
BrStyleLook >> when: aStateBlock style: aStyleBlock [
	| aTargetState |
	
	aTargetState := aStateBlock glamourValueWithArgs: { self state }.
	aStyleBlock value: (self styleFor: aTargetState)
]
