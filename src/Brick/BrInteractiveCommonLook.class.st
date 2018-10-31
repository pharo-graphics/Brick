Class {
	#name : #BrInteractiveCommonLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-! Core'
}

{ #category : #'api - style' }
BrInteractiveCommonLook >> default: aBlock [	
	self style: [ :aStyler | aStyler default: aBlock ]
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> disabled: aBlock [	
	self style: [ :aStyler | aStyler disabled: aBlock ]
]

{ #category : #'api - style' }
BrInteractiveCommonLook >> enabled: aBlock [	
	self style: [ :aStyler | aStyler enabled: aBlock ]
]
