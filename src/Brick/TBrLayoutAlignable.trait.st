Trait {
	#name : #TBrLayoutAlignable,
	#category : #'Brick-Layout Alignment - UI'
}

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignBottomCenter [
	"Align all my children to the center of the bottom edge"

	self dispatchEvent: BrLayoutAlignmentWish bottomCenter
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignBottomLeft [
	"Align all my children to the bottom left corner"

	self dispatchEvent: BrLayoutAlignmentWish bottomLeft
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignBottomRight [
	"Align all my children to the bottom right corner"

	self dispatchEvent: BrLayoutAlignmentWish bottomRight
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignCenter [
	"Align all my children at my center"

	self dispatchEvent: BrLayoutAlignmentWish center
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignCenterLeft [
	"Align all my children to the center of my left edge"

	self dispatchEvent: BrLayoutAlignmentWish centerLeft
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignCenterRight [
	"Align all my children to the center of my right edge"

	self dispatchEvent: BrLayoutAlignmentWish centerRight
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignTopCenter [
	"Align all my children to the center of the top edge"

	self dispatchEvent: BrLayoutAlignmentWish topCenter
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignTopLeft [
	"Align all my children to the top left corner"

	self dispatchEvent: BrLayoutAlignmentWish topLeft
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignTopRight [
	"Align all my children to the top right corner"

	self dispatchEvent: BrLayoutAlignmentWish topRight
]
