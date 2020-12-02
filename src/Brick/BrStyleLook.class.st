Class {
	#name : #BrStyleLook,
	#superclass : #BrLook,
	#traits : 'TBlElementStyles',
	#classTraits : 'TBlElementStyles classTrait',
	#instVars : [
		'styles'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #'private - adding' }
BrStyleLook >> basicAddStyle: aStyle [
	styles basicAddStyle: aStyle.
	self widgetDo: [ :aWidget | aWidget style addStyle: aStyle ]
]

{ #category : #initialization }
BrStyleLook >> initialize [
	super initialize.
	
	styles := BlStyles new.

	self addChange:
		(BrLookChange new
			up: [ :e | e widget style addStyles: styles styles ];
			down: [ :e | e widget style removeStyles: styles styles ];
			yourself)
]

{ #category : #'private - adding' }
BrStyleLook >> styleForState: aState ifFound: aFoundBlock ifNone: aNoneBlock [
	^ styles
		styleForState: aState
		ifFound: aFoundBlock
		ifNone: aNoneBlock
]
