Class {
	#name : #BrShadowLook,
	#superclass : #BrLook,
	#instVars : [
		'shadow',
		'cornerRadius'
	],
	#category : 'Brick-! Core'
}

{ #category : #initialization }
BrShadowLook >> initialize [
	super initialize.

	shadow := (BlDropShadowEffect color: (Color black alpha: 0.3) width: 2 offset: 0.2@1)
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
	self widgetDo: [ self widgetContent effect: self shadow ]
]
