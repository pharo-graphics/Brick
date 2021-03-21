Class {
	#name : #BrAnchoredPositionerExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Anchored'
}

{ #category : #accessing }
BrAnchoredPositionerExamples >> anchor [
	<gtExample>
	^ BlElement new
		size: 30 @ 20;
		background: Color green;
		yourself
]

{ #category : #accessing }
BrAnchoredPositionerExamples >> anchorContainer [
	<gtExample>
	^ BlElement new
		layout: BlLinearLayout horizontal;
		background: Color yellow;
		padding:
			(BlInsets
				top: 5
				left: 7
				bottom: 11
				right: 17);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredPositionerExamples >> anchorPosition: aBlock relocateAnchored: anotherBlock assertAnchoredMaxBounds: yetAnotherBlock [
	| space positioner anchor anchorContainer target targetContainer popup popupSize popupPreferredMaxBoundsInTarget |
	space := BlSpace new
		extent: 800 @ 600;
		yourself.
	positioner := self anchoredPositioner.
	anchor := positioner anchor.
	target := positioner target.
	anchorContainer := self anchorContainer.
	targetContainer := self targetContainer.
	popup := self popup.
	anchor constraintsDo: [ :c | c ignoreByLayout ].
	popup constraintsDo: [ :c | c ignoreByLayout ].
	targetContainer addChild: target.
	target addChild: anchorContainer.
	anchorContainer addChild: anchor.
	target addChild: popup.
	space root
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		addChild: targetContainer.
	space doUpdateLayout.
	anchor relocate: (aBlock cull: target cull: anchor).
	space doUpdateLayout.
	popupSize := target size / 4.
	popupPreferredMaxBoundsInTarget := positioner
		maxBoundsPreferredInTarget: popupSize.
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
BrAnchoredPositionerExamples >> anchoredPositioner [
	<gtExample>
	^ BrAnchoredPositioner anchor: self anchor target: self target
]

{ #category : #'as yet unclassified' }
BrAnchoredPositionerExamples >> bottomLeft [
	<gtExample>
	^ self
		anchorPosition:
			[ :target :anchor | 7 * (target size - anchor size) / 8 - (0 @ (6 / 8 * target height)) ]
		relocateAnchored:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget topRight - (popupSize x @ 0) ]
		assertAnchoredMaxBounds: [ :target :anchor :popup | 
			BlBounds
				origin: 0 @ (anchor bounds inSpace inChild: target) bottom
				corner: (anchor bounds inSpace inChild: target) right @ target height ]
]

{ #category : #'as yet unclassified' }
BrAnchoredPositionerExamples >> bottomRight [
	<gtExample>
	^ self
		anchorPosition: [ :target :anchor | (target size - anchor size) / 8 ]
		relocateAnchored:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget topLeft ]
		assertAnchoredMaxBounds:
			[ :target :anchor :popup | BlBounds origin: (anchor bounds inSpace inChild: target) bottomLeft corner: target size ]
]

{ #category : #accessing }
BrAnchoredPositionerExamples >> defaultToBottomRight [
	<gtExample>
	^ self
		anchorPosition: [ :target :anchor | (target size - anchor size) / 2 ]
		relocateAnchored:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget topLeft ]
		assertAnchoredMaxBounds:
			[ :target :anchor :popup | BlBounds origin: (anchor bounds inSpace inChild: target) bottomLeft corner: target size ]
]

{ #category : #accessing }
BrAnchoredPositionerExamples >> popup [
	<gtExample>
	^ BlElement new
		background: Color white;
		border: (BlBorder paint: Color blue asBlPaint width: 1);
		yourself
]

{ #category : #accessing }
BrAnchoredPositionerExamples >> target [
	<gtExample>
	^ BlElement new
		layout: BlLinearLayout horizontal;
		size: 300 @ 200;
		transformDo: [ :t | t scaleBy: 0.5 @ 0.5 ];
		background: Color orange;
		padding:
			(BlInsets
				top: 5
				left: 7
				bottom: 11
				right: 17);
		yourself
]

{ #category : #accessing }
BrAnchoredPositionerExamples >> targetContainer [
	<gtExample>
	^ BlElement new
		layout: BlLinearLayout horizontal;
		background: Color red;
		padding:
			(BlInsets
				top: 5
				left: 7
				bottom: 11
				right: 17);
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		yourself
]

{ #category : #'as yet unclassified' }
BrAnchoredPositionerExamples >> topLeft [
	<gtExample>
	^ self
		anchorPosition: [ :target :anchor | 7 * (target size - anchor size) / 8 ]
		relocateAnchored:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget bottomRight - popupSize ]
		assertAnchoredMaxBounds:
			[ :target :anchor :popup | BlBounds origin: 0 @ 0 corner: (anchor bounds inSpace inChild: target) topRight ]
]

{ #category : #'as yet unclassified' }
BrAnchoredPositionerExamples >> topRight [
	<gtExample>
	^ self
		anchorPosition: [ :target :anchor | 
			(target size - anchor size) / 8
				+ (0 @ (6 / 8 * (target size - anchor size) y)) ]
		relocateAnchored:
			[ :popupPreferredMaxBoundsInTarget :popupSize | popupPreferredMaxBoundsInTarget bottomLeft - (0 @ popupSize y) ]
		assertAnchoredMaxBounds: [ :target :anchor :popup | 
			BlBounds
				origin: (anchor bounds inSpace inChild: target) left @ 0
				corner: target width @ (anchor bounds inSpace inChild: target) top ]
]
