Trait {
	#name : #TBrLayoutResizable,
	#category : #'Brick-Layout Resizer - UI'
}

{ #category : #'api - style' }
TBrLayoutResizable >> exact: aPoint [
	| aSize |
	
	aSize := aPoint asPoint.
	self hExact: aSize x.
	self vExact: aSize y
]

{ #category : #'api - style' }
TBrLayoutResizable >> fitContent [
	self hFitContent.
	self vFitContent
]

{ #category : #'api - style' }
TBrLayoutResizable >> fitContentLimited [
	self hFitContentLimited.
	self vFitContentLimited
]

{ #category : #'api - style' }
TBrLayoutResizable >> hExact: aNumber [
	self dispatchEvent: (BrLayoutHorizontalResizerWish exact: aNumber)
]

{ #category : #'api - style' }
TBrLayoutResizable >> hFitContent [
	self dispatchEvent: (BrLayoutHorizontalResizerWish fitContent)
]

{ #category : #'api - style' }
TBrLayoutResizable >> hFitContentLimited [
	self dispatchEvent: (BrLayoutHorizontalResizerWish fitContentLimited)
]

{ #category : #'api - style' }
TBrLayoutResizable >> hMatchParent [
	self dispatchEvent: (BrLayoutHorizontalResizerWish matchParent)
]

{ #category : #'api - style' }
TBrLayoutResizable >> matchParent [
	self hMatchParent.
	self vMatchParent
]

{ #category : #'api - style' }
TBrLayoutResizable >> vExact: aNumber [
	self dispatchEvent: (BrLayoutVerticalResizerWish exact: aNumber)
]

{ #category : #'api - style' }
TBrLayoutResizable >> vFitContent [
	self dispatchEvent: (BrLayoutVerticalResizerWish fitContent)
]

{ #category : #'api - style' }
TBrLayoutResizable >> vFitContentLimited [
	self dispatchEvent: (BrLayoutVerticalResizerWish fitContentLimited)
]

{ #category : #'api - style' }
TBrLayoutResizable >> vMatchParent [
	self dispatchEvent: (BrLayoutVerticalResizerWish matchParent)
]
