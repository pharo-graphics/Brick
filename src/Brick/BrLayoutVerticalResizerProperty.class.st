Class {
	#name : #BrLayoutVerticalResizerProperty,
	#superclass : #BrLayoutResizerProperty,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #'api - property' }
BrLayoutVerticalResizerProperty >> applyOnElement: anElement [
	self resizer isExact
		ifTrue: [ anElement states addState: (BrLayoutVerticalResizerState exact) ].
		
	self resizer isFitContent
		ifTrue: [ anElement states addState: (BrLayoutVerticalResizerState fitContent) ].
		
	self resizer isFitContentLimited
		ifTrue: [ anElement states addState: (BrLayoutVerticalResizerState fitContentLimited) ].
		
	self resizer isMatchParent
		ifTrue: [ anElement states addState: (BrLayoutVerticalResizerState matchParent) ].

	anElement constraints vertical resizer = self resizer
		ifTrue: [ ^ self ].

	anElement constraintsDo: [ :c | c vertical resizer: self resizer ]
]
