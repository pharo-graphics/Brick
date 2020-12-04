Class {
	#name : #BrLayoutResizerProperty,
	#superclass : #BlElementProperty,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-! Core - Layout Resizer'
}

{ #category : #'api - layout resizeable' }
BrLayoutResizerProperty >> exact: aNumber [
	self resizer: (BlLayoutResizer exact: aNumber)
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerProperty >> fitContent [
	self resizer: BlLayoutResizer fitContent
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerProperty >> fitContentLimited [
	self resizer: BlLayoutResizer fitContentLimited
]

{ #category : #'api - layout resizeable' }
BrLayoutResizerProperty >> matchParent [
	self resizer: BlLayoutResizer matchParent
]

{ #category : #accessing }
BrLayoutResizerProperty >> resizer [
	^ resizer
]

{ #category : #accessing }
BrLayoutResizerProperty >> resizer: anObject [
	resizer := anObject
]
