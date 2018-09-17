Class {
	#name : #BrGlamorousFocusableShadowLook,
	#superclass : #BrShadowLook,
	#category : #'Brick-Glamorous-Shadow'
}

{ #category : #initialization }
BrGlamorousFocusableShadowLook >> initialize [
	super initialize.
	
	self add: (BrInteractiveLook new style: [ :aStyler |
		aStyler default: [ self color: (BrGlamorousColors darkBorderColor alpha: 0.5) ].
		aStyler focused: [ self color: (BrGlamorousColors primaryBorderColor alpha: 0.75) ] ])
]
