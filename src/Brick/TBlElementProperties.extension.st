Extension { #name : #TBlElementProperties }

{ #category : #'*Brick' }
TBlElementProperties >> hExact: aWidth [
	self addProperty: (BrLayoutHorizontalResizerProperty new exact: aWidth)
]

{ #category : #'*Brick' }
TBlElementProperties >> hFitContent [
	self addProperty: (BrLayoutHorizontalResizerProperty new fitContent)
]

{ #category : #'*Brick' }
TBlElementProperties >> hFitContentLimited [
	self addProperty: (BrLayoutHorizontalResizerProperty new fitContentLimited)
]

{ #category : #'*Brick' }
TBlElementProperties >> hMatchParent [
	self addProperty: (BrLayoutHorizontalResizerProperty new matchParent)
]

{ #category : #'*Brick' }
TBlElementProperties >> vExact: aHeight [
	self addProperty: (BrLayoutVerticalResizerProperty new exact: aHeight)
]

{ #category : #'*Brick' }
TBlElementProperties >> vFitContent [
	self addProperty: (BrLayoutVerticalResizerProperty new fitContent)
]

{ #category : #'*Brick' }
TBlElementProperties >> vFitContentLimited [
	self addProperty: (BrLayoutVerticalResizerProperty new fitContentLimited)
]

{ #category : #'*Brick' }
TBlElementProperties >> vMatchParent [
	self addProperty: (BrLayoutVerticalResizerProperty new matchParent)
]
