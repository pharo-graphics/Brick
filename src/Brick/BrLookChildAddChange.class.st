Class {
	#name : #BrLookChildAddChange,
	#superclass : #BrLookPropertyChange,
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrLookChildAddChange >> containerOn: aLook [
	^ (path copyFrom: 1 to: path size - 1)
		inject: aLook widget
		into: [ :e :f | e childNamed: f ]
]

{ #category : #initialization }
BrLookChildAddChange >> readOn: aLook [
	^ (self containerOn: aLook)
		childNamed: path last
		ifFound: #yourself
		ifNone: nil
]

{ #category : #initialization }
BrLookChildAddChange >> writeOn: aLook value: anObject [
	| container |
	container := self containerOn: aLook.
	^ anObject
		ifNil: [ container removeChildNamed: path last ]
		ifNotNil: [ container addChild: anObject as: path last ]
]
