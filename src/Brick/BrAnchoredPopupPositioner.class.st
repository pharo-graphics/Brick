Class {
	#name : #BrAnchoredPopupPositioner,
	#superclass : #Object,
	#instVars : [
		'anchor',
		'target',
		'anchorBoundsInTarget',
		'popupPreferredMaxBoundsInTarget',
		'popupPreferredPosition'
	],
	#category : #'Brick-Popup - UI'
}

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner class >> anchor: anElement target: anotherElement [
	^ self new
		anchor: anElement;
		target: anotherElement;
		yourself
]

{ #category : #accessing }
BrAnchoredPopupPositioner >> anchor [
	^ anchor
]

{ #category : #accessing }
BrAnchoredPopupPositioner >> anchor: anObject [
	anchor := anObject
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> anchorBoundsInTarget [
	^ anchorBoundsInTarget
		ifNil: [ anchorBoundsInTarget := anchor bounds inSpace inChild: target ]
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupBottomLeftMaxBoundsInTarget [
	| anchorBounds |
	anchorBounds := self anchorBoundsInTarget.
	^ BlBounds
		origin: 0 @ anchorBounds bottom
		corner: anchorBounds right @ target size y
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupBottomRightMaxBoundsInTarget [
	| anchorBounds |
	anchorBounds := self anchorBoundsInTarget.
	^ BlBounds
		origin: anchorBounds bottomLeft
		corner: target size
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupPreferredMaxBoundsInTarget: anExtent [
	"Initializes #popupPreferredMaxBoundsInTarget and #popupPreferredPosition"

	^ popupPreferredMaxBoundsInTarget
		ifNil: [ | allPopupBounds fallback |
			popupPreferredMaxBoundsInTarget := self
				popupBottomRightMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget extent >= anExtent
				ifTrue: [ popupPreferredPosition := #bottom -> #right.
					^ popupPreferredMaxBoundsInTarget ].
			allPopupBounds := OrderedCollection new.
			allPopupBounds
				add: #bottom -> #right -> popupPreferredMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget := self
				popupBottomLeftMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget extent >= anExtent
				ifTrue: [ popupPreferredPosition := #bottom -> #left.
					^ popupPreferredMaxBoundsInTarget ].
			allPopupBounds
				add: #bottom -> #left -> popupPreferredMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget := self
				popupTopRightMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget extent >= anExtent
				ifTrue: [ popupPreferredPosition := #top -> #right.
					^ popupPreferredMaxBoundsInTarget ].
			allPopupBounds
				add: #top -> #right -> popupPreferredMaxBoundsInTarget.
			popupPreferredMaxBoundsInTarget := self
				popupTopLeftMaxBoundsInTarget.
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
BrAnchoredPopupPositioner >> popupPreferredPosition [
	"Answers an association of symbols, e.g. #top->#right, to denote the relative position of the popup to the anchor.
	Requires #popupPreferredMaxBoundsInTarget: to be called before to initialize it, answers nil otherwise."

	^ popupPreferredPosition
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupPreferredPositionIsBottom [
	^ popupPreferredPosition key = #bottom
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupPreferredPositionIsLeft [
	^ popupPreferredPosition value = #left
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupPreferredPositionIsRight [
	^ popupPreferredPosition value = #right
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupPreferredPositionIsTop [
	^ popupPreferredPosition key = #top
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupTopLeftMaxBoundsInTarget [
	| anchorBounds |
	anchorBounds := self anchorBoundsInTarget.
	^ BlBounds origin: 0 @ 0 corner: anchorBounds topRight
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositioner >> popupTopRightMaxBoundsInTarget [
	| anchorBounds |
	anchorBounds := self anchorBoundsInTarget.
	^ BlBounds
		origin: anchorBounds left @ 0
		corner: target bounds width @ anchorBounds top
]

{ #category : #accessing }
BrAnchoredPopupPositioner >> target [
	^ target
]

{ #category : #accessing }
BrAnchoredPopupPositioner >> target: anObject [
	target := anObject
]
