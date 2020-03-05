Class {
	#name : #BrLayoutResizerModel,
	#superclass : #BrStateModel,
	#instVars : [
		'resizer'
	],
	#category : #'Brick-Layout Resizer - Model'
}

{ #category : #'instance creation' }
BrLayoutResizerModel class >> exact: aNumber [
	^ self new exact: aNumber
]

{ #category : #'instance creation' }
BrLayoutResizerModel class >> fitContent [
	^ self new fitContent
]

{ #category : #'instance creation' }
BrLayoutResizerModel class >> matchParent [
	^ self new matchParent
]

{ #category : #'instance creation' }
BrLayoutResizerModel >> exact: aNumber [
	self resizer: (BlLayoutResizer exact: aNumber)
]

{ #category : #'instance creation' }
BrLayoutResizerModel >> fitContent [
	self resizer: BlLayoutResizer fitContent
]

{ #category : #initialization }
BrLayoutResizerModel >> initialize [
	super initialize.

	resizer := BlLayoutResizer exact: 50
]

{ #category : #'instance creation' }
BrLayoutResizerModel >> matchParent [
	self resizer: BlLayoutResizer matchParent
]

{ #category : #accessing }
BrLayoutResizerModel >> resizer [
	<return: #BlLayoutResizer>

	^ resizer
]

{ #category : #accessing }
BrLayoutResizerModel >> resizer: aLayoutResizer [
	resizer = aLayoutResizer
		ifTrue: [ ^ self ].

	resizer := aLayoutResizer.
	self notifyStateChanged: aLayoutResizer
]
