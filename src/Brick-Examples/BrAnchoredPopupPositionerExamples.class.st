Class {
	#name : #BrAnchoredPopupPositionerExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Popup'
}

{ #category : #accessing }
BrAnchoredPopupPositionerExamples >> anchor [
	<gtExample>
	^ BlElement new
		size: 30 @ 20;
		background: Color blue;
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositionerExamples >> anchorPosition: aBlock relocatePopup: anotherBlock assertPopupMaxBounds: yetAnotherBlock [
	| space positioner anchor target popup popupSize popupPreferredMaxBoundsInTarget |
	space := BlSpace new
		extent: 800 @ 600;
		yourself.
	positioner := self anchoredPopupPositioner.
	anchor := positioner anchor.
	target := positioner target.
	popup := self popup.
	anchor constraintsDo: [ :c | c ignoreByLayout ].
	popup constraintsDo: [ :c | c ignoreByLayout ].
	target addChild: anchor.
	target addChild: popup.
	space root
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChild: target.
	space doUpdateLayout.
	anchor relocate: (aBlock cull: target cull: anchor).
	space doUpdateLayout.
	popupSize := target size / 4.
	popupPreferredMaxBoundsInTarget := positioner
		popupPreferredMaxBoundsInTarget: popupSize.
	popup
		size: popupSize;
		relocate: (anotherBlock cull: popupPreferredMaxBoundsInTarget cull: popupSize).
	self
		assert:
			popupPreferredMaxBoundsInTarget
				= (yetAnotherBlock cull: target cull: anchor cull: popup).
	^ space
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositionerExamples >> anchoredPopupPositioner [
	<gtExample>
	^ BrAnchoredPopupPositioner anchor: self anchor target: self target
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositionerExamples >> bottomLeft [
	<gtExample>
	^ self
		anchorPosition:
			[ :target :anchor | 7 * (target size - anchor size) / 8 - (0 @ (6 / 8 * target height)) ]
		relocatePopup:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget topRight - (popupSize x @ 0) ]
		assertPopupMaxBounds: [ :target :anchor :popup | 
			BlBounds
				origin: 0 @ (anchor bounds inSpace inChild: target) bottom
				corner: (anchor bounds inSpace inChild: target) right @ target height ]
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositionerExamples >> bottomRight [
	<gtExample>
	^ self
		anchorPosition: [ :target :anchor | (target size - anchor size) / 8 ]
		relocatePopup:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget topLeft ]
		assertPopupMaxBounds:
			[ :target :anchor :popup | BlBounds origin: (anchor bounds inSpace inChild: target) bottomLeft corner: target size ]
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositionerExamples >> defaultToBottomRight [
	<gtExample>
	^ self
		anchorPosition: [ :target :anchor | (target size - anchor size) / 2 ]
		relocatePopup:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget topLeft ]
		assertPopupMaxBounds:
			[ :target :anchor :popup | BlBounds origin: anchor bounds bottomLeft corner: target size ]
]

{ #category : #accessing }
BrAnchoredPopupPositionerExamples >> popup [
	<gtExample>
	^ BlElement new
		background: (Color yellow alpha: 0.5);
		border: (BlBorder paint: Color black asBlPaint width: 1);
		yourself
]

{ #category : #accessing }
BrAnchoredPopupPositionerExamples >> target [
	<gtExample>
	^ BlElement new
		size: 300 @ 200;
		background: Color red;
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositionerExamples >> topLeft [
	<gtExample>
	^ self
		anchorPosition: [ :target :anchor | 7 * (target size - anchor size) / 8 ]
		relocatePopup:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget bottomRight - popupSize ]
		assertPopupMaxBounds:
			[ :target :anchor :popup | BlBounds origin: 0 @ 0 corner: (anchor bounds inSpace inChild: target) topRight ]
]

{ #category : #'as yet unclassified' }
BrAnchoredPopupPositionerExamples >> topRight [
	<gtExample>
	^ self
		anchorPosition:
			[ :target :anchor | (target size - anchor size) / 8 + (0 @ (6 / 8 * target size y)) ]
		relocatePopup:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget bottomLeft - (0 @ popupSize y) ]
		assertPopupMaxBounds: [ :target :anchor :popup | 
			BlBounds
				origin: (anchor bounds inSpace inChild: target) left @ 0
				corner: target width @ (anchor bounds inSpace inChild: target) top ]
]
