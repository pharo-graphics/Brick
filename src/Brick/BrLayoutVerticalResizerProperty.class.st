Class {
	#name : #BrLayoutVerticalResizerProperty,
	#superclass : #BrLayoutResizerProperty,
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #'api - property' }
BrLayoutVerticalResizerProperty >> applyOnElement: anElement [
	anElement constraints vertical resizer = self resizer
		ifTrue: [ ^ self ].

	anElement constraintsDo: [ :c | c vertical resizer: self resizer ]
]

{ #category : #accessing }
BrLayoutVerticalResizerProperty >> printOn: aStream [
	aStream
		nextPutAll: 'Horizontal resizer - ';
		print: self resizer
]
