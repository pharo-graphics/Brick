Class {
	#name : #BrLayoutVerticalResizerState,
	#superclass : #BrLayoutResizerState,
	#classInstVars : [
		'any'
	],
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #accessing }
BrLayoutVerticalResizerState class >> any [
	^ any ifNil: [ any := self exact or: (self fitContent or: (self fitContentLimited or: self matchParent)) ]
]

{ #category : #cleanup }
BrLayoutVerticalResizerState class >> cleanUp [
	any := nil
]

{ #category : #'instance creation' }
BrLayoutVerticalResizerState class >> exact [
	^ BrLayoutVerticalExactResizerState uniqueInstance
]

{ #category : #'instance creation' }
BrLayoutVerticalResizerState class >> fitContent [
	^ BrLayoutVerticalFitContentResizerState uniqueInstance
]

{ #category : #'instance creation' }
BrLayoutVerticalResizerState class >> fitContentLimited [
	^ BrLayoutVerticalFitContentLimitedResizerState uniqueInstance
]

{ #category : #'instance creation' }
BrLayoutVerticalResizerState class >> local [
	^ BrLayoutVerticalLocalResizerState uniqueInstance
]

{ #category : #'instance creation' }
BrLayoutVerticalResizerState class >> matchParent [
	^ BrLayoutVerticalMatchParentResizerState uniqueInstance
]

{ #category : #printing }
BrLayoutVerticalResizerState >> printOn: aStream [
	aStream
		nextPutAll: 'vertical resizer - '
]

{ #category : #accessing }
BrLayoutVerticalResizerState >> type [
	"Return an object used to compare two states when adding to the collection of states in order to prevent
	elements from having duplicated states"
	<return: #Object>

	^ BrLayoutVerticalResizerState
]
