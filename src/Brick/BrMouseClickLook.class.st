"
[[[
BlElement new
	look: BrLayoutLook linearHorizontal fitContent + BrLabelLook + BrMouseClickLook;
	background: (Color white);
	padding: (BlInsets all: 10);
	effect: (BlDropShadowEffect color: (Color black alpha: 0.3) width: 2 offset: 0.2@1)
]]]
"
Class {
	#name : #BrMouseClickLook,
	#superclass : #BrLook,
	#instVars : [
		'effect',
		'previousEffect'
	],
	#category : 'Brick-! Core'
}

{ #category : #initialization }
BrMouseClickLook >> defaultEffect [
	^ BlOverlayAboveEffect new paint: (Color black alpha: 0.5)
]

{ #category : #accessing }
BrMouseClickLook >> effect [
	^ effect
]

{ #category : #accessing }
BrMouseClickLook >> effect: aBlElementEffect [
	effect := aBlElementEffect.
]

{ #category : #initialization }
BrMouseClickLook >> initialize [
	super initialize.
	effect := self defaultEffect.
	previousEffect := BlNullEffect new.
]

{ #category : #'mouse handlers' }
BrMouseClickLook >> mouseDownEvent: anEvent [
	self widget effect = self effect ifTrue: [ ^ self ].
	previousEffect := self widget effect.
	self effect input: nil.
	self widget effect: self effect.
]

{ #category : #'mouse handlers' }
BrMouseClickLook >> mouseUpEvent: anEvent [
	previousEffect input: nil.
	self widget effect: previousEffect.
]
