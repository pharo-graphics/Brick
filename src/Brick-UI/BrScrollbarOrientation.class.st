Class {
	#name : #BrScrollbarOrientation,
	#superclass : #Object,
	#category : 'Brick-UI-Scrollbar'
}

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> breadthOf: aTarget [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> defaultLayout [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> for: aTarget breadth: aValue [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> for: aTarget length: aValue [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> imageRotate: anImage [
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> layoutDecButton: aButton [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> layoutIncButton: aButton [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> layoutTrack: aTrackRegion [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> layoutWidget: aWidget [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> lengthOf: aTarget [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> minLengthOf: aTarget [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> positionFromPoint: aPoint [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
BrScrollbarOrientation >> translate: aTarget by: aNumber [
	self subclassResponsibility 
]
