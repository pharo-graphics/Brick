Class {
	#name : #BrGlamorousShadowEffect,
	#superclass : #BlGaussianShadowEffect,
	#category : #'Brick-Glamorous-Shadow'
}

{ #category : #initialization }
BrGlamorousShadowEffect >> defaultColor [
	^ Color black alpha: 0.3
]

{ #category : #initialization }
BrGlamorousShadowEffect >> defaultOffset [
	^ 0@1
]

{ #category : #initialization }
BrGlamorousShadowEffect >> defaultWidth [
	^ 2
]
