"
I add a simple flat shadow around an element.

To work properly and element should have some margin in order for the shadow to not be clipped by the parent bounds
"
Class {
	#name : #BrFlatShadowAptitude,
	#superclass : #BrAptitude,
	#instVars : [
		'shadow'
	],
	#category : #'Brick-! Core - Looks'
}

{ #category : #accessing }
BrFlatShadowAptitude >> color: aColor [
	self shadow: (self shadow copyWithColor: aColor)
]

{ #category : #initialization }
BrFlatShadowAptitude >> initialize [
	super initialize.

	shadow := BlSimpleShadowEffect
		color: (Color black alpha: 0.3)
		offset: 5 @ 5.

	self addChangeProperty: #(widget effect) withCopy: [ self shadow ]
]

{ #category : #accessing }
BrFlatShadowAptitude >> offset: aColor [
	self shadow: (self shadow copyWithOffset: aColor)
]

{ #category : #private }
BrFlatShadowAptitude >> shadow [
	<return: #BlSimpleShadowEffect>

	^ shadow
]

{ #category : #private }
BrFlatShadowAptitude >> shadow: aBlDropShadowEffect [
	shadow := aBlDropShadowEffect.
	self
		widgetDo: [ changes
				downOn: self;
				upOn: self ]
]
