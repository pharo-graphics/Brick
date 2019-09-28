Class {
	#name : #BrEntailmentConclusionRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Entailment - Events'
}

{ #category : #initialization }
BrEntailmentConclusionRequest >> responseClass [
	^ BrEntailmentConclusionChanged
]
