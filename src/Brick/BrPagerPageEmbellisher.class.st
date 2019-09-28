Class {
	#name : #BrPagerPageEmbellisher,
	#superclass : #BrStencil,
	#instVars : [
		'contentElement'
	],
	#category : 'Brick-Pager - Stencil'
}

{ #category : #accessing }
BrPagerPageEmbellisher >> contentElement [
	^ contentElement
]

{ #category : #accessing }
BrPagerPageEmbellisher >> contentElement: anElement [
	contentElement := anElement
]

{ #category : #'api - instantiation' }
BrPagerPageEmbellisher >> create [
	<return: #BlElement>

	^ self contentElement
]
