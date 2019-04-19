Class {
	#name : #BrShadowLook,
	#superclass : #BrLook,
	#instVars : [
		'shadow',
		'cornerRadius'
	],
	#category : 'Brick-! Core'
}

{ #category : #accessing }
BrShadowLook >> color: aColor [
	self shadow: (self shadow copyWithColor: aColor)
]

{ #category : #initialization }
BrShadowLook >> finalizeLook [
	super finalizeLook.
	shadow := self shadow copyWithColor: self shadow color
]

{ #category : #initialization }
BrShadowLook >> initialize [
	super initialize.
	changes
		add: (#(widget effect) asBrLookPropertyChangeWithValue: [ self shadow ]).
	shadow := BlDropShadowEffect
		color: (Color black alpha: 0.3)
		width: 4
		offset: 0 @ 1
]

{ #category : #accessing }
BrShadowLook >> shadow [
	<return: #BlDropShadowEffect>

	^ shadow
]

{ #category : #accessing }
BrShadowLook >> shadow: aBlDropShadowEffect [
	shadow := aBlDropShadowEffect.
	self
		widgetDo: [ changes
				downOn: self;
				upOn: self ]
]
