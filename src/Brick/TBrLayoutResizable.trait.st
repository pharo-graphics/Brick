Trait {
	#name : #TBrLayoutResizable,
	#category : #'Brick-Layout Resizer - UI'
}

{ #category : #'api - style' }
TBrLayoutResizable >> hExact: aNumber [
	self dispatchEvent: (BrLayoutHorizontalResizerWish exact: aNumber)
]

{ #category : #'api - style' }
TBrLayoutResizable >> hFitContent [
	self dispatchEvent: (BrLayoutHorizontalResizerWish fitContent)
]

{ #category : #'api - style' }
TBrLayoutResizable >> hMatchParent [
	self dispatchEvent: (BrLayoutHorizontalResizerWish matchParent)
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
TBrLayoutResizable >> vMatchParent [
	self dispatchEvent: (BrLayoutVerticalResizerWish matchParent)
]
