Class {
	#name : #BrLayoutHorizontalResizerState,
	#superclass : #BrLayoutResizerState,
	#classInstVars : [
		'any'
	],
	#category : #'Brick-Core-Layout Resizer'
}

{ #category : #'instance creation' }
BrLayoutHorizontalResizerState class >> any [
	^ any ifNil: [ any := self exact or: (self fitContent or: (self fitContentLimited or: self matchParent)) ]
]

{ #category : #cleanup }
BrLayoutHorizontalResizerState class >> cleanUp [
	any := nil
]

{ #category : #'instance creation' }
BrLayoutHorizontalResizerState class >> exact [
	^ BrLayoutHorizontalExactResizerState uniqueInstance
]

{ #category : #'instance creation' }
BrLayoutHorizontalResizerState class >> fitContent [
	^ BrLayoutHorizontalFitContentResizerState uniqueInstance
]

{ #category : #'instance creation' }
BrLayoutHorizontalResizerState class >> fitContentLimited [
	^ BrLayoutHorizontalFitContentLimitedResizerState uniqueInstance
]

{ #category : #'instance creation' }
BrLayoutHorizontalResizerState class >> local [
	^ BrLayoutHorizontalLocalResizerState uniqueInstance
]

{ #category : #'instance creation' }
BrLayoutHorizontalResizerState class >> matchParent [
	^ BrLayoutHorizontalMatchParentResizerState uniqueInstance
]

{ #category : #printing }
BrLayoutHorizontalResizerState >> printOn: aStream [
	aStream
		nextPutAll: 'horizontal resizer - '
]

{ #category : #accessing }
BrLayoutHorizontalResizerState >> type [
	"Return an object used to compare two states when adding to the collection of states in order to prevent
	elements from having duplicated states"
	<return: #Object>

	^ BrLayoutHorizontalResizerState
]
