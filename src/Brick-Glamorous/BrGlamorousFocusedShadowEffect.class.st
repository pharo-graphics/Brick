Class {
	#name : #BrGlamorousFocusedShadowEffect,
	#superclass : #BrGlamorousShadowEffect,
	#category : #'Brick-Glamorous-Shadow'
}

{ #category : #initialization }
BrGlamorousFocusedShadowEffect >> defaultColor [
	^ BrGlamorousColors primaryBorderColor alpha: 0.4
]
