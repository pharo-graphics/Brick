Class {
	#name : #BrScrollbarTrackRequest,
	#superclass : #BrRequest,
	#category : #'Brick-Scrollbar - Events'
}

{ #category : #initialization }
BrScrollbarTrackRequest >> responseClass [
	^ BrScrollbarTrackChanged
]
