Class {
	#name : #BrStyleEventListener,
	#superclass : #BlElementEventListener,
	#instVars : [
		'styleable'
	],
	#category : 'Brick-Style-EventListener'
}

{ #category : #'as yet unclassified' }
BrStyleEventListener >> applyStyles [
	styleable styler apply.
	styleable invalidate.
]

{ #category : #'as yet unclassified' }
BrStyleEventListener >> computeStyles [
	styleable stylesheets computeStyleNodes.
	self applyStyles
]

{ #category : #'as yet unclassified' }
BrStyleEventListener >> elementAdded: anEvent [
	self computeStyles
]

{ #category : #'as yet unclassified' }
BrStyleEventListener >> elementRemoved: anEvent [
	"self computeStyles"
]

{ #category : #'element handlers' }
BrStyleEventListener >> elementStateChanged: anEvent [
	self applyStyles
]

{ #category : #'as yet unclassified' }
BrStyleEventListener >> onInstalledIn: aStyleable [
	styleable := aStyleable.
	super onInstalledIn: aStyleable.
	"self computeStyles"
]
