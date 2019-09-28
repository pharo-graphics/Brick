"
I add a simple flat shadow around an element.

To work properly and element should have some margin in order for the shadow to not be clipped by the parent bounds
"
Class {
	#name : #BrFlatShadowLook,
	#superclass : #BrLook,
	#instVars : [
		'shadow'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #accessing }
BrFlatShadowLook >> color: aColor [
	self shadow: (self shadow copyWithColor: aColor)
]

{ #category : #initialization }
BrFlatShadowLook >> initialize [
	super initialize.

	shadow := BlSimpleShadowEffect
		color: (Color black alpha: 0.3)
		offset: 5 @ 5.

	self addChangeProperty: #(widget effect) withCopy: [ self shadow ]
]

{ #category : #accessing }
BrFlatShadowLook >> offset: aColor [
	self shadow: (self shadow copyWithOffset: aColor)
]

{ #category : #private }
BrFlatShadowLook >> shadow [
	<return: #BlSimpleShadowEffect>

	^ shadow
]

{ #category : #private }
BrFlatShadowLook >> shadow: aBlDropShadowEffect [
	shadow := aBlDropShadowEffect.
	self
		widgetDo: [ changes
				downOn: self;
				upOn: self ]
]
