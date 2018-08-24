"
I represent a scrollable editor element. I support scrolling, selection and other various features.
"
Class {
	#name : #BrEditorElement,
	#superclass : #BlInfiniteElement,
	#instVars : [
		'hasFocus'
	],
	#category : 'Brick-Editor-UI'
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

{ #category : #'focus testing' }
BrEditorElement >> hasFocus [

	^ super hasFocus or: [ hasFocus ]
]

{ #category : #initialization }
BrEditorElement >> initialize [
	super initialize.
	
	hasFocus := false
]

{ #category : #'focus requesting' }
BrEditorElement >> looseFocus: aChildElement [
	super looseFocus: aChildElement.
	
	hasFocus := false
]

{ #category : #'focus requesting' }
BrEditorElement >> requestFocus: aChildElement [
	super requestFocus: aChildElement.
	hasFocus := true
]

{ #category : #scrolling }
BrEditorElement >> scrollToLast [
	"Scroll instantly to the last segment"
	
	self scrollToPosition: self editor segmentCollector computedSegmentsCount
]
