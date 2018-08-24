Class {
	#name : #BrScrollPaneViewport,
	#superclass : #BlElement,
	#category : 'Brick-UI-ScrollPane'
}

{ #category : #initialization }
BrScrollPaneViewport >> initialize [
	super initialize.
	self styleClass: #viewport.
	self constraintsDo: [:c| 
		c horizontal matchParent.
		c vertical matchParent ].
]

{ #category : #accessing }
BrScrollPaneViewport >> nodeHeight [
	self children ifEmpty:[^ 1].
	^ self children first height
]

{ #category : #accessing }
BrScrollPaneViewport >> nodeWidth [
	self children ifEmpty:[^ 1].
	^ self children first width
]
