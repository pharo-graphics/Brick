Class {
	#name : #BrProgress,
	#superclass : #BlElement,
	#category : #'Brick-Progress - UI'
}

{ #category : #initialization }
BrProgress >> initialize [
	super initialize.
	self viewModel: BrProgressModel new.
	self addChild: BlElement new as: BrProgressLook widgetProgressName.
]

{ #category : #enumerating }
BrProgress >> progressBarDo: anOneArgBlock [
	anOneArgBlock value: (self childNamed: BrProgressLook widgetProgressName)
]
