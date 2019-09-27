"
I am sent to the ${class:BrExpandableModel}$ to receive its state (expanded / collapsed)
"
Class {
	#name : #BrExpansionStateRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Core - Events'
}

{ #category : #initialization }
BrExpansionStateRequest >> responseClass [
	^ BrExpansionChanged
]
