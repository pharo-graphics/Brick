Class {
	#name : #BrLayoutResizerWish,
	#superclass : #BrWish,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-! Deprecated'
}

{ #category : #'instance creation' }
BrLayoutResizerWish class >> exact: aNumber [
	<argument: #aNumber satisfies: #isBlocFiniteFloat>
	<argument: #aNumber satisfies: #isBlocPositiveFloat>

	^ self resizer: (BlLayoutResizer exact: aNumber)
]

{ #category : #'instance creation' }
BrLayoutResizerWish class >> fitContent [
	^ self resizer: BlLayoutResizer fitContent
]

{ #category : #'instance creation' }
BrLayoutResizerWish class >> fitContentLimited [
	^ self resizer: BlLayoutResizer fitContentLimited
]

{ #category : #testing }
BrLayoutResizerWish class >> isDeprecated [
	^ true
]

{ #category : #'instance creation' }
BrLayoutResizerWish class >> matchParent [
	^ self resizer: BlLayoutResizer matchParent
]

{ #category : #'instance creation' }
BrLayoutResizerWish class >> resizer: aLayoutResizer [
	^ self new resizer: aLayoutResizer
]

{ #category : #accessing }
BrLayoutResizerWish >> resizer [
	^ resizer
]

{ #category : #accessing }
BrLayoutResizerWish >> resizer: anObject [
	resizer := anObject
]
