Class {
	#name : #BrGlamorousFocusableShadowAptitude,
	#superclass : #BrShadowAptitude,
	#category : #'Brick-Glamorous-Shadow'
}

{ #category : #initialization }
BrGlamorousFocusableShadowAptitude >> initialize [
	super initialize.
	
	self add: (BrStyleCommonAptitude new
		focused: [ :aStyle |
			aStyle
				do: [ self color: (BrGlamorousColors primaryBorderColor alpha: 0.75) ]
				after: [ self color: (BrGlamorousColors darkBorderColor alpha: 0.5) ] ])
]
