Class {
	#name : #BrCursorStencil,
	#superclass : #BrStencil,
	#classInstVars : [
		'uniqueInstance'
	],
	#category : #'Brick-Editor-UI - Stencils'
}

{ #category : #accessing }
BrCursorStencil class >> cleanUp [
	super cleanUp.
	
	uniqueInstance := nil
]

{ #category : #accessing }
BrCursorStencil class >> uniqueInstance [
	^ uniqueInstance ifNil: [ uniqueInstance := self new ]
]

{ #category : #'api - instantiation' }
BrCursorStencil >> create [
	^ BrCursorElement new
		constraintsDo: [ :c |
			c horizontal exact: 1.
			c vertical matchParent ];
		background: Color black
]
