Trait {
	#name : #TBrLayoutAlignable,
	#category : #'Brick-Layout Alignment - UI'
}

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignBottomCenter [
	self dispatchEvent: BrLayoutAlignmentWish bottomCenter
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignBottomLeft [
	self dispatchEvent: BrLayoutAlignmentWish bottomLeft
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignBottomRight [
	self dispatchEvent: BrLayoutAlignmentWish bottomRight
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignCenter [
	self dispatchEvent: BrLayoutAlignmentWish center
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignCenterLeft [
	self dispatchEvent: BrLayoutAlignmentWish centerLeft
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignCenterRight [
	self dispatchEvent: BrLayoutAlignmentWish centerRight
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignTopCenter [
	self dispatchEvent: BrLayoutAlignmentWish topCenter
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignTopLeft [
	self dispatchEvent: BrLayoutAlignmentWish topLeft
]

{ #category : #'api - alignment' }
TBrLayoutAlignable >> alignTopRight [
	self dispatchEvent: BrLayoutAlignmentWish topRight
]
