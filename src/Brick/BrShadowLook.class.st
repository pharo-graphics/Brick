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

	self widgetDo: [ :aWidget | aWidget effect: BlNullEffect new ].
	shadow := self shadow copyWithColor: self shadow color
]

{ #category : #initialization }
BrShadowLook >> initialize [
	super initialize.

	shadow := (BlDropShadowEffect color: (Color black alpha: 0.3) width: 4 offset: 0@1)
]

{ #category : #initialization }
BrShadowLook >> initializeLook [
	super initializeLook.

	self updateShadow
]

{ #category : #accessing }
BrShadowLook >> shadow [
	<return: #BlDropShadowEffect>

	^ shadow
]

{ #category : #accessing }
BrShadowLook >> shadow: aBlDropShadowEffect [
	shadow := aBlDropShadowEffect.

	self updateShadow
]

{ #category : #updating }
BrShadowLook >> updateShadow [
	self widgetDo: [ :aWidget | aWidget effect: self shadow ]
]
