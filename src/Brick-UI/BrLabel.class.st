Class {
	#name : #BrLabel,
	#superclass : #BrLabeled,
	#category : 'Brick-UI-Label'
}

{ #category : #'as yet unclassified' }
BrLabel >> defaultController [
	^ BrInteractiveController new 
]

{ #category : #'as yet unclassified' }
BrLabel >> defaultSkin [
	^ BrLabelSkin new
]

{ #category : #'as yet unclassified' }
BrLabel >> pickObject: aPoint [
	(self containsGlobalPoint: aPoint)
		ifFalse: [ ^ nil ].
	^ self
]
