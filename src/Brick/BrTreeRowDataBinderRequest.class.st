Class {
	#name : #BrTreeRowDataBinderRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Tree - Events'
}

{ #category : #initialization }
BrTreeRowDataBinderRequest >> responseClass [
	^ BrTreeRowDataBinderChangedEvent
]
