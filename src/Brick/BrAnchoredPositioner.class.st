Class {
	#name : #BrAnchoredPositioner,
	#superclass : #Object,
	#instVars : [
		'target',
		'anchor',
		'anchorBoundsInTarget',
		'popupPreferredMaxBoundsInTarget',
		'popupPreferredPosition'
	],
	#category : #'Brick-Anchored - Support'
}

{ #category : #'as yet unclassified' }
BrAnchoredPositioner class >> anchor: anElement target: anotherElement [
	^ self new
		anchor: anElement;
		target: anotherElement;
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner class >> anchorBoundsInTarget: aBounds target: anotherElement [
	^ self new
		anchorBoundsInTarget: aBounds;
		target: anotherElement;
		yourself
]

{ #category : #accessing }
BrAnchoredPositioner >> anchor [
	^ anchor
]

{ #category : #accessing }
BrAnchoredPositioner >> anchor: anObject [
	anchor := anObject
]

{ #category : #accessing }
BrAnchoredPositioner >> anchorBoundsInTarget [
	^ anchorBoundsInTarget
		ifNil: [ anchor
				ifNotNil: [ anchorBoundsInTarget := anchor bounds inSpace inChild: target ] ]
]

{ #category : #accessing }
BrAnchoredPositioner >> anchorBoundsInTarget: anObject [
	anchorBoundsInTarget := anObject
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> maxBoundsBottomLeftInTarget [
	^ BlBounds
		origin: 0.0 @ self anchorBoundsInTarget bottom
		corner: self anchorBoundsInTarget right @ target size y
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> maxBoundsBottomRightInTarget [
	^ BlBounds
		origin: self anchorBoundsInTarget bottomLeft
		corner: target size
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> maxBoundsPreferredInTarget: anExtent [
	"Initializes #popupPreferredMaxBoundsInTarget and #popupPreferredPosition"

	^ popupPreferredMaxBoundsInTarget
		ifNil: [ | allPopupBounds fallback |
			popupPreferredMaxBoundsInTarget := self
				maxBoundsBottomRightInTarget.
			popupPreferredMaxBoundsInTarget extent >= anExtent
				ifTrue: [ popupPreferredPosition := #bottom -> #right.
					^ popupPreferredMaxBoundsInTarget ].
			allPopupBounds := OrderedCollection new.
			allPopupBounds
				add: #bottom -> #right -> popupPreferredMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget := self
				maxBoundsBottomLeftInTarget.
			popupPreferredMaxBoundsInTarget extent >= anExtent
				ifTrue: [ popupPreferredPosition := #bottom -> #left.
					^ popupPreferredMaxBoundsInTarget ].
			allPopupBounds
				add: #bottom -> #left -> popupPreferredMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget := self
				maxBoundsTopRightInTarget.
			popupPreferredMaxBoundsInTarget extent >= anExtent
				ifTrue: [ popupPreferredPosition := #top -> #right.
					^ popupPreferredMaxBoundsInTarget ].
			allPopupBounds
				add: #top -> #right -> popupPreferredMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget := self
				maxBoundsTopLeftInTarget.
			popupPreferredMaxBoundsInTarget extent >= anExtent
				ifTrue: [ popupPreferredPosition := #top -> #left.
					^ popupPreferredMaxBoundsInTarget ].
			allPopupBounds
				add: #top -> #left -> popupPreferredMaxBoundsInTarget.
			fallback := (allPopupBounds
				sorted: [ :a :b | a value asRectangle area >= b value asRectangle area ])
				first.
			popupPreferredPosition := fallback key.
			popupPreferredMaxBoundsInTarget := fallback value.
			^ popupPreferredMaxBoundsInTarget ]
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> maxBoundsTopLeftInTarget [
	^ BlBounds origin: 0.0 @ 0.0 corner: self anchorBoundsInTarget topRight
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> maxBoundsTopRightInTarget [
	^ BlBounds
		origin: self anchorBoundsInTarget left @ 0.0
		corner: target bounds width @ self anchorBoundsInTarget top
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> positionPreferred [
	"Answers an association of symbols, e.g. #top->#right, to denote the relative position of the popup to the anchor.
	Requires #popupPreferredMaxBoundsInTarget: to be called before to initialize it, answers nil otherwise."

	^ popupPreferredPosition
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> positionPreferredIsBottom [
	^ popupPreferredPosition key = #bottom
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> positionPreferredIsLeft [
	^ popupPreferredPosition value = #left
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> positionPreferredIsRight [
	^ popupPreferredPosition value = #right
]

{ #category : #'as yet unclassified' }
BrAnchoredPositioner >> positionPreferredIsTop [
	^ popupPreferredPosition key = #top
]

{ #category : #accessing }
BrAnchoredPositioner >> target [
	^ target
]

{ #category : #accessing }
BrAnchoredPositioner >> target: anObject [
	target := anObject
]
