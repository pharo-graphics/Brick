Class {
	#name : #BrButtonBase,
	#superclass : #BrLabeled,
	#category : 'Brick-Old'
}

{ #category : #'initialize-release' }
BrButtonBase >> defaultController [
	^ BrButtonBaseControllerOld new
]

{ #category : #'initialize-release' }
BrButtonBase >> defaultSkin [
	^ BrButtonBaseSkin new
]
