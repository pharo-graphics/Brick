Class {
	#name : #BrResizerInteractiveLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Resizer - Look'
}

{ #category : #accessing }
BrResizerInteractiveLook >> bottom: aBlock [	
	self style: [ :aStyler | aStyler bottom: aBlock ]
]

{ #category : #accessing }
BrResizerInteractiveLook >> horizontal: aBlock [	
	self style: [ :aStyler | aStyler horizontal: aBlock ]
]

{ #category : #'api - style' }
BrResizerInteractiveLook >> style: aBlock [
	aBlock value: (BrResizerStyler on: self)
]

{ #category : #accessing }
BrResizerInteractiveLook >> top: aBlock [	
	self style: [ :aStyler | aStyler top: aBlock ]
]
