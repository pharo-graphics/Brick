"
I represent a scrollable editor element. I support scrolling, selection and other various features.
"
Class {
	#name : #BrEditorElement,
	#superclass : #BlInfiniteElement,
	#category : #'Brick-Editor-UI'
}

{ #category : #conversion }
BrEditorElement >> asScrollableElement [
	^ self
]

{ #category : #'api - editor' }
BrEditorElement >> beEditable [
	self editor beEditable
]

{ #category : #'api - editor' }
BrEditorElement >> beReadOnlyWithSelection [
	self editor beReadOnlyWithSelection
]

{ #category : #'api - editor' }
BrEditorElement >> beReadOnlyWithoutSelection [
	self editor beReadOnlyWithoutSelection
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
BrEditorElement >> editor: aBrTextEditor [
	self dataSource: aBrTextEditor.
	aBrTextEditor view: self
]

{ #category : #scrolling }
BrEditorElement >> scrollToLast [
	"Scroll instantly to the last segment"
	
	self scrollToPosition: self editor segmentCollector computedSegmentsCount
]
