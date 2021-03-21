Class {
	#name : #BrLookAddChildAsChange,
	#superclass : #BrLookPropertyChange,
	#category : #'Brick-Core-Changes'
}

{ #category : #initialization }
BrLookAddChildAsChange >> containerOn: aLook [
	self flag: 'ugly hack around widgetContent'.
	^ path first = #content
		ifTrue: [ path size >= 2
				ifTrue: [ (path copyFrom: 2 to: path size - 1)
						inject: aLook widgetContent
						into: [ :e :f | e childNamed: f ] ]
				ifFalse: [ aLook widget ] ]
		ifFalse: [ (path copyFrom: 1 to: path size - 1)
				inject: aLook widget
				into: [ :e :f | e childNamed: f ] ]
]

{ #category : #printing }
BrLookAddChildAsChange >> printOn: aStream [
	aStream nextPutAll: 'add child as '.
	super printOn: aStream
]

{ #category : #initialization }
BrLookAddChildAsChange >> readOn: aLook [
	^ (self containerOn: aLook)
		childNamed: path last
		ifFound: #yourself
		ifNone: nil
]

{ #category : #initialization }
BrLookAddChildAsChange >> writeOn: aLook value: anObject [
	| container |
	container := self containerOn: aLook.
	^ anObject
		ifNil: [ container removeChildNamed: path last ]
		ifNotNil: [ container addChild: anObject as: path last ]
]
