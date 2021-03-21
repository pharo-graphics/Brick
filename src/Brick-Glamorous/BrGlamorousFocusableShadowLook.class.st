Class {
	#name : #BrGlamorousFocusableShadowLook,
	#superclass : #BrShadowLook,
	#category : #'Brick-Glamorous-Shadow'
}

{ #category : #initialization }
BrGlamorousFocusableShadowLook >> initialize [
	super initialize.
	
	self add: (BrStyleCommonLook new
		focused: [ :aStyle |
			aStyle
				do: [ self color: (BrGlamorousColors primaryBorderColor alpha: 0.75) ]
				after: [ self color: (BrGlamorousColors darkBorderColor alpha: 0.5) ] ])
]
