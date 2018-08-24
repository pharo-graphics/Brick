Class {
	#name : #BrScrollbarThumb,
	#superclass : #BlElement,
	#instVars : [
		'scrollbar'
	],
	#category : 'Brick-UI-Scrollbar'
}

{ #category : #'as yet unclassified' }
BrScrollbarThumb class >> scrollbar: aScrollbar [
	^ self new scrollbar: aScrollbar
]

{ #category : #'as yet unclassified' }
BrScrollbarThumb >> beAtBottom [
	self constraintsDo: [ :c | c alignBottomCenter ]
]

{ #category : #'as yet unclassified' }
BrScrollbarThumb >> beAtRight [
	self constraintsDo: [ :c | c alignCenterRight ]
]

{ #category : #'as yet unclassified' }
BrScrollbarThumb >> initialize [
	super initialize.
	self styleClass: #thumb.
	self managed: false
]

{ #category : #'as yet unclassified' }
BrScrollbarThumb >> privateBreadth [
	^ scrollbar orientation breadthOf: self
]

{ #category : #'as yet unclassified' }
BrScrollbarThumb >> privateBreadth: aValue [
	scrollbar orientation for: self breadth: aValue.
]

{ #category : #accessing }
BrScrollbarThumb >> scrollbar [
	^ scrollbar
]

{ #category : #accessing }
BrScrollbarThumb >> scrollbar: anObject [
	scrollbar := anObject
]
