Extension { #name : #BlElementLocalProperties }

{ #category : #'*Brick' }
BlElementLocalProperties >> hExact: aWidth [
	self addProperty: (BrLayoutHorizontalResizerProperty new exact: aWidth)
]

{ #category : #'*Brick' }
BlElementLocalProperties >> hFitContent [
	self addProperty: (BrLayoutHorizontalResizerProperty new fitContent)
]

{ #category : #'*Brick' }
BlElementLocalProperties >> hFitContentLimited [
	self addProperty: (BrLayoutHorizontalResizerProperty new fitContentLimited)
]

{ #category : #'*Brick' }
BlElementLocalProperties >> hMatchParent [
	self addProperty: (BrLayoutHorizontalResizerProperty new matchParent)
]

{ #category : #'*Brick' }
BlElementLocalProperties >> vExact: aHeight [
	self addProperty: (BrLayoutVerticalResizerProperty new exact: aHeight)
]

{ #category : #'*Brick' }
BlElementLocalProperties >> vFitContent [
	self addProperty: (BrLayoutVerticalResizerProperty new fitContent)
]

{ #category : #'*Brick' }
BlElementLocalProperties >> vFitContentLimited [
	self addProperty: (BrLayoutVerticalResizerProperty new fitContentLimited)
]

{ #category : #'*Brick' }
BlElementLocalProperties >> vMatchParent [
	self addProperty: (BrLayoutVerticalResizerProperty new matchParent)
]
