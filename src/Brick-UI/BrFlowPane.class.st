Class {
	#name : #BrFlowPane,
	#superclass : #BrPane,
	#category : 'Brick-UI-LayoutPane'
}

{ #category : #initialization }
BrFlowPane >> defaultLayout [
	^ BlFlowLayout horizontal
]
