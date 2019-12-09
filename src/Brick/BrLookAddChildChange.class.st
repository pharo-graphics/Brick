Class {
	#name : #BrLookAddChildChange,
	#superclass : #BrLookPropertyChange,
	#instVars : [
		'child'
	],
	#category : #'Brick-! Core'
}

{ #category : #initialization }
BrLookAddChildChange >> containerOn: aLook [

	path
		ifEmpty: [ ^ aLook widget ].
	
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
BrLookAddChildChange >> printOn: aStream [
	aStream nextPutAll: 'add child '.
	super printOn: aStream
]

{ #category : #initialization }
BrLookAddChildChange >> readOn: aLook [
	^ child
]

{ #category : #initialization }
BrLookAddChildChange >> writeOn: aLook value: anObject [
	| container |
	container := self containerOn: aLook.
	^ anObject
		ifNil: [ container removeChild: child ]
		ifNotNil: [ child := anObject.
			container addChild: anObject ]
]
