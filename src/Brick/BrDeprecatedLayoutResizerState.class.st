Class {
	#name : #BrDeprecatedLayoutResizerState,
	#superclass : #BrInteractionState,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #factory }
BrDeprecatedLayoutResizerState class >> any [
	^ self exact or: (self matchParent or: (self fitContent or: self fitContentLimited))
]

{ #category : #'instance creation' }
BrDeprecatedLayoutResizerState class >> exact [
	^ self resizer: (BlLayoutResizer exact: 0.0)
]

{ #category : #'instance creation' }
BrDeprecatedLayoutResizerState class >> exact: aNumber [
	<argument: #aNumber satisfies: #isBlocFiniteFloat>
	<argument: #aNumber satisfies: #isBlocPositiveFloat>

	^ self resizer: (BlLayoutResizer exact: aNumber)
]

{ #category : #'instance creation' }
BrDeprecatedLayoutResizerState class >> fitContent [
	^ self resizer: BlLayoutResizer fitContent
]

{ #category : #'instance creation' }
BrDeprecatedLayoutResizerState class >> fitContentLimited [
	^ self resizer: BlLayoutResizer fitContentLimited
]

{ #category : #factory }
BrDeprecatedLayoutResizerState class >> horizontal [
	^ BrDeprecatedLayoutHorizontalResizerState
]

{ #category : #testing }
BrDeprecatedLayoutResizerState class >> isDeprecated [
	^ true
]

{ #category : #'instance creation' }
BrDeprecatedLayoutResizerState class >> matchParent [
	^ self resizer: BlLayoutResizer matchParent
]

{ #category : #'instance creation' }
BrDeprecatedLayoutResizerState class >> resizer: aLayoutResizer [
	^ self subclassResponsibility
]

{ #category : #factory }
BrDeprecatedLayoutResizerState class >> vertical [
	^ BrDeprecatedLayoutVerticalResizerState
]

{ #category : #comparing }
BrDeprecatedLayoutResizerState >> = anObject [
	"Answer whether the receiver and anObject represent the same object."

	self == anObject
		ifTrue: [ ^ true ].
	self class = anObject class
		ifFalse: [ ^ false ].
	^ resizer class = anObject resizer class
]

{ #category : #comparing }
BrDeprecatedLayoutResizerState >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ self class hash bitXor: resizer class hash
]

{ #category : #accessing }
BrDeprecatedLayoutResizerState >> resizer [
	^ resizer
]

{ #category : #accessing }
BrDeprecatedLayoutResizerState >> resizer: aLayoutResizer [
	resizer := aLayoutResizer
]
