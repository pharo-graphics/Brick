Trait {
	#name : #TBrLayoutResizable,
	#category : #'Brick-! Core - Layout Resizer'
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

	"we have to set the size in the constraints because the resizer state is stateless and does not propagate the actual size value"
	(self constraints horizontal resizer isExact
		and: [ self constraints horizontal resizer size = aNumber ])
			ifFalse: [ self constraintsDo: [ :c | c horizontal exact: aNumber ] ].

	self states addState: BrLayoutHorizontalResizerState exact
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> hFitContent [
	self states addState: BrLayoutHorizontalResizerState fitContent
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> hFitContentLimited [
	self states addState: BrLayoutHorizontalResizerState fitContentLimited
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> hLocal [
	self states addState: BrLayoutHorizontalResizerState local
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> hMatchParent [
	self states addState: BrLayoutHorizontalResizerState matchParent
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> matchParent [
	self hMatchParent.
	self vMatchParent
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vExact: aNumber [
	
	"we have to set the size in the constraints because the resizer state is stateless and does not propagate the actual size value"
	(self constraints vertical resizer isExact
		and: [ self constraints vertical resizer size = aNumber ])
			ifFalse: [
				self constraintsDo: [ :c | c vertical exact: aNumber ] ].

	self states addState: BrLayoutVerticalResizerState exact
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vFitContent [
	self states addState: BrLayoutVerticalResizerState fitContent
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vFitContentLimited [
	self states addState: BrLayoutVerticalResizerState fitContentLimited
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vLocal [
	self states addState: BrLayoutVerticalResizerState local
]

{ #category : #'api - layout resizeable' }
TBrLayoutResizable >> vMatchParent [
	self states addState: BrLayoutVerticalResizerState matchParent
]
