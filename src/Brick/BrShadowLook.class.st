"
I add a gaussian shadow around an element.

To work properly and element should have some margin in order for the shadow to not be clipped by the parent bounds
"
Class {
	#name : #BrShadowLook,
	#superclass : #BrLook,
	#instVars : [
		'shadow'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #accessing }
BrShadowLook >> beLarge [
	self 
		width: 6;
		offset: 0@3
]

{ #category : #accessing }
BrShadowLook >> color: aColor [
	self shadow: (self shadow copyWithColor: aColor)
]

{ #category : #initialization }
BrShadowLook >> initialize [
	super initialize.
	
	shadow := BlGaussianShadowEffect
		color: BrGlamorousColors defaultShadowColor
		width: 2
		offset: 0 @ 1.
		
	self addChange: (BrLookChange new
		up: [ :e | e widget effect: shadow ];
		down: [ :e | e widget effect: BlNullEffect new ]).
]

{ #category : #accessing }
BrShadowLook >> offset: aColor [
	self shadow: (self shadow copyWithOffset: aColor)
]

{ #category : #private }
BrShadowLook >> shadow [
	<return: #BlGaussianShadowEffect>

	^ shadow
]

{ #category : #private }
BrShadowLook >> shadow: aBlDropShadowEffect [
	shadow := aBlDropShadowEffect.
	self
		widgetDo: [ changes
				downOn: self;
				upOn: self ]
]

{ #category : #accessing }
BrShadowLook >> width: aNumber [
	self shadow: (self shadow copyWithWidth: aNumber)
]
