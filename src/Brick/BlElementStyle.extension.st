Extension { #name : #BlElementStyle }

{ #category : #'*Brick' }
BlElementStyle >> hExact: aWidth [
	self addProperty: (BrLayoutHorizontalResizerProperty new exact: aWidth)
]

{ #category : #'*Brick' }
BlElementStyle >> hFitContent [
	self addProperty: (BrLayoutHorizontalResizerProperty new fitContent)
]

{ #category : #'*Brick' }
BlElementStyle >> hFitContentLimited [
	self addProperty: (BrLayoutHorizontalResizerProperty new fitContentLimited)
]

{ #category : #'*Brick' }
BlElementStyle >> hMatchParent [
	self addProperty: (BrLayoutHorizontalResizerProperty new matchParent)
]

{ #category : #'*Brick' }
BlElementStyle >> vExact: aHeight [
	self addProperty: (BrLayoutVerticalResizerProperty new exact: aHeight)
]

{ #category : #'*Brick' }
BlElementStyle >> vFitContent [
	self addProperty: (BrLayoutVerticalResizerProperty new fitContent)
]

{ #category : #'*Brick' }
BlElementStyle >> vFitContentLimited [
	self addProperty: (BrLayoutVerticalResizerProperty new fitContentLimited)
]

{ #category : #'*Brick' }
BlElementStyle >> vMatchParent [
	self addProperty: (BrLayoutVerticalResizerProperty new matchParent)
]
