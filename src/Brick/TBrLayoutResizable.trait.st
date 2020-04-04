Trait {
	#name : #TBrLayoutResizable,
	#category : #'Brick-Layout Resizer - UI'
}

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> exact: aPoint [
	| aSize |
	
	aSize := aPoint asPoint.
	self hExact: aSize x.
	self vExact: aSize y
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> fitContent [
	self hFitContent.
	self vFitContent
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> fitContentLimited [
	self hFitContentLimited.
	self vFitContentLimited
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> hExact: aNumber [
	self dispatchEvent: (BrLayoutHorizontalResizerWish exact: aNumber)
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> hFitContent [
	self dispatchEvent: (BrLayoutHorizontalResizerWish fitContent)
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> hFitContentLimited [
	self dispatchEvent: (BrLayoutHorizontalResizerWish fitContentLimited)
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> hMatchParent [
	self dispatchEvent: (BrLayoutHorizontalResizerWish matchParent)
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> matchParent [
	self hMatchParent.
	self vMatchParent
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vExact: aNumber [
	self dispatchEvent: (BrLayoutVerticalResizerWish exact: aNumber)
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vFitContent [
	self dispatchEvent: (BrLayoutVerticalResizerWish fitContent)
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vFitContentLimited [
	self dispatchEvent: (BrLayoutVerticalResizerWish fitContentLimited)
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vMatchParent [
	self dispatchEvent: (BrLayoutVerticalResizerWish matchParent)
]
