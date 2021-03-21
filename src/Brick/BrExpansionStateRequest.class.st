"
I am sent to the ${class:BrExpandableModel}$ to receive its state (expanded / collapsed)
"
Class {
	#name : #BrExpansionStateRequest,
	#superclass : #BrRequest,
	#category : #'Brick-! Deprecated'
}

{ #category : #testing }
BrExpansionStateRequest class >> isDeprecated [
	^ true
]

{ #category : #initialization }
BrExpansionStateRequest >> responseClass [
	^ BrExpansionChanged
]
