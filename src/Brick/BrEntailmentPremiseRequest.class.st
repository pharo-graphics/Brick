Class {
	#name : #BrEntailmentPremiseRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Entailment - Events'
}

{ #category : #initialization }
BrEntailmentPremiseRequest >> responseClass [
	^ BrEntailmentPremiseChanged
]
