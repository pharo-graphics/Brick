Class {
	#name : #BrLookChildAddChange,
	#superclass : #BrLookPropertyChange,
	#instVars : [
		'child'
	],
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrLookChildAddChange >> containerOn: aLook [
	self flag: 'ugly hack around widgetContent'.
	^ path first = #content
		ifTrue: [ path size >= 2
				ifTrue: [ (path copyFrom: 2 to: path size)
						inject: aLook widgetContent
						into: [ :e :f | e childNamed: f ] ]
				ifFalse: [ aLook widget ] ]
		ifFalse: [ (path copyFrom: 1 to: path size)
				inject: aLook widget
				into: [ :e :f | e childNamed: f ] ]
]

{ #category : #printing }
BrLookChildAddChange >> printOn: aStream [
	aStream nextPutAll: 'add child '.
	super printOn: aStream
]

{ #category : #initialization }
BrLookChildAddChange >> readOn: aLook [
	^ child
]

{ #category : #initialization }
BrLookChildAddChange >> writeOn: aLook value: anObject [
	| container |
	container := self containerOn: aLook.
	^ anObject
		ifNil: [ container removeChild: child ]
		ifNotNil: [ child := anObject.
			container addChild: anObject ]
]
