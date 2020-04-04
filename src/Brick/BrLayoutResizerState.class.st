Class {
	#name : #BrLayoutResizerState,
	#superclass : #BrInteractionState,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-Layout Resizer - States'
}

{ #category : #factory }
BrLayoutResizerState class >> any [
	^ self exact or: (self matchParent or: (self fitContent or: self fitContentLimited))
]

{ #category : #'instance creation' }
BrLayoutResizerState class >> exact [
	^ self resizer: (BlLayoutResizer exact: 0)
]

{ #category : #'instance creation' }
BrLayoutResizerState class >> exact: aNumber [
	^ self resizer: (BlLayoutResizer exact: aNumber)
]

{ #category : #'instance creation' }
BrLayoutResizerState class >> fitContent [
	^ self resizer: BlLayoutResizer fitContent
]

{ #category : #'instance creation' }
BrLayoutResizerState class >> fitContentLimited [
	^ self resizer: BlLayoutResizer fitContentLimited
]

{ #category : #factory }
BrLayoutResizerState class >> horizontal [
	^ BrLayoutHorizontalResizerState
]

{ #category : #'instance creation' }
BrLayoutResizerState class >> matchParent [
	^ self resizer: BlLayoutResizer matchParent
]

{ #category : #'instance creation' }
BrLayoutResizerState class >> resizer: aLayoutResizer [
	^ self subclassResponsibility
]

{ #category : #factory }
BrLayoutResizerState class >> vertical [
	^ BrLayoutVerticalResizerState
]

{ #category : #comparing }
BrLayoutResizerState >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ resizer class = anObject resizer class
]

{ #category : #comparing }
BrLayoutResizerState >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash bitXor: resizer class hash
]

{ #category : #accessing }
BrLayoutResizerState >> resizer [
	^ resizer
]

{ #category : #accessing }
BrLayoutResizerState >> resizer: aLayoutResizer [
	resizer := aLayoutResizer
]
