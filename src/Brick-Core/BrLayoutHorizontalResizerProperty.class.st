Class {
	#name : #BrLayoutHorizontalResizerProperty,
	#superclass : #BrLayoutResizerProperty,
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #'api - property' }
BrLayoutHorizontalResizerProperty >> applyOnElement: anElement [
	anElement constraints horizontal resizer = self resizer
		ifTrue: [ ^ self ].

	anElement constraintsDo: [ :c | c horizontal resizer: self resizer ]
]

{ #category : #accessing }
BrLayoutHorizontalResizerProperty >> printOn: aStream [
	aStream
		nextPutAll: 'Vertical resizer - ';
		print: self resizer
]
