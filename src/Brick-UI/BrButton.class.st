Class {
	#name : #BrButton,
	#superclass : #BrButtonBase,
	#category : 'Brick-UI-Button'
}

{ #category : #'initialize-release' }
BrButton >> defaultSkin [
	^ BrButtonSkin new
]
