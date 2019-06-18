Class {
	#name : #BrPopupPositioner,
	#superclass : #Object,
	#instVars : [
		'anchor',
		'target',
		'popup',
		'anchorBoundsInTarget'
	],
	#category : #'Brick-Dropdown - Stencils'
}

{ #category : #'as yet unclassified' }
BrPopupPositioner class >> anchor: anElement target: anotherElement popup: yetAnotherElement [
	^ self new
		anchor: anElement;
		target: anotherElement;
		popup: yetAnotherElement;
		yourself
]

{ #category : #accessing }
BrPopupPositioner >> anchor [
	^ anchor
]

{ #category : #accessing }
BrPopupPositioner >> anchor: anObject [
	anchor := anObject
]

{ #category : #'as yet unclassified' }
BrPopupPositioner >> anchorBoundsInTarget [
	^ anchorBoundsInTarget
		ifNil: [ anchorBoundsInTarget := anchor bounds inSpace inChild: target ]
]

{ #category : #accessing }
BrPopupPositioner >> popup [
	^ popup
]

{ #category : #accessing }
BrPopupPositioner >> popup: anObject [
	popup := anObject
]

{ #category : #'as yet unclassified' }
BrPopupPositioner >> popupBottomLeftMaxBoundsInTarget [
	| anchorBounds |
	anchorBounds := self anchorBoundsInTarget.
	^ BlBounds
		origin: 0 @ anchorBounds bottom
		corner: anchorBounds right @ target bounds bottom
]

{ #category : #'as yet unclassified' }
BrPopupPositioner >> popupBottomRightMaxBoundsInTarget [
	| anchorBounds |
	anchorBounds := self anchorBoundsInTarget.
	^ BlBounds
		origin: anchorBounds bottomLeft
		corner: target bounds bottomRight
]

{ #category : #'as yet unclassified' }
BrPopupPositioner >> popupTopLeftMaxBoundsInTarget [
	| anchorBounds |
	anchorBounds := self anchorBoundsInTarget.
	^ BlBounds origin: 0 @ 0 corner: anchorBounds topRight
]

{ #category : #'as yet unclassified' }
BrPopupPositioner >> popupTopRightMaxBoundsInTarget [
	| anchorBounds |
	anchorBounds := self anchorBoundsInTarget.
	^ BlBounds
		origin: anchorBounds top @ 0
		corner: target bounds bottomRight
]

{ #category : #accessing }
BrPopupPositioner >> target [
	^ target
]

{ #category : #accessing }
BrPopupPositioner >> target: anObject [
	target := anObject
]
