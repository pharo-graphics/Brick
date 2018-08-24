"
[[[
BlElement new
	look: BrLayoutLook linearHorizontal fitContent + BrLabelLook + BrMouseHoverLook;
	background: (Color white);
	padding: (BlInsets all: 10);
	effect: (BlDropShadowEffect color: (Color black alpha: 0.3) width: 2 offset: 0.2@1)
]]]
"
Class {
	#name : #BrMouseHoverLook,
	#superclass : #BrLook,
	#instVars : [
		'effect',
		'previousEffect'
	],
	#category : 'Brick-! Core'
}

{ #category : #initialization }
BrMouseHoverLook >> defaultEffect [
	^ BlOverlayAboveEffect new paint: (Color gray alpha: 0.1)
]

{ #category : #accessing }
BrMouseHoverLook >> effect [
	^ effect
]

{ #category : #accessing }
BrMouseHoverLook >> effect: aBlElementEffect [
	effect := aBlElementEffect.
]

{ #category : #initialization }
BrMouseHoverLook >> initialize [
	super initialize.
	effect := self defaultEffect.
	previousEffect := BlNullEffect new.
]

{ #category : #'mouse handlers' }
BrMouseHoverLook >> mouseEnterEvent: anEvent [
	self widget effect = self effect ifTrue: [ ^ self ].
	previousEffect := self widget effect.
	self effect input: nil.
	self widget effect: self effect.
]

{ #category : #'mouse handlers' }
BrMouseHoverLook >> mouseLeaveEvent: anEvent [
	previousEffect input: nil.
	self widget effect: previousEffect.
]
