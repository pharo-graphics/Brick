"
I represent a scrollable editor element. I support scrolling, selection and other various features.
"
Class {
	#name : #BrEditorElement,
	#superclass : #BlInfiniteElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Editor-UI'
}

{ #category : #conversion }
BrEditorElement >> asScrollableElement [
	^ self
]

{ #category : #initialization }
BrEditorElement >> defaultLayout [
	^ BlInfiniteLinearLayout vertical
]

{ #category : #accessing }
BrEditorElement >> editor [
	^ self dataSource
]

{ #category : #accessing }
BrEditorElement >> editor: aBrTextEdior [
	self dataSource: aBrTextEdior
]

{ #category : #initialization }
BrEditorElement >> initialize [
	super initialize.
	
	self viewModel: (BrInteractiveModel withAll: {
		BrLayoutHorizontalResizerModel matchParent.
		BrLayoutVerticalResizerModel fitContent }).

	self look: (BrLayoutResizerLook inherit)
]

{ #category : #scrolling }
BrEditorElement >> scrollToLast [
	"Scroll instantly to the last segment"
	
	self scrollToPosition: self editor segmentCollector computedSegmentsCount
]
