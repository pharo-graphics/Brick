"
I represent a scrollable editor element. I support scrolling, selection and other various features.
"
Class {
	#name : #BrEditorElement,
	#superclass : #BlInfiniteElement,
	#instVars : [
		'hasFocus'
	],
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
	<return: #BrTextEditor>

	^ self dataSource
]

{ #category : #accessing }
BrEditorElement >> editor: aBrTextEditor [
	self dataSource: aBrTextEditor.
	self dataSource view: self.
]

{ #category : #'focus testing' }
BrEditorElement >> hasFocus [
	^ hasFocus or: [ self isFocused ]
]

{ #category : #initialization }
BrEditorElement >> initialize [
	super initialize.

	hasFocus := false.
	self when: BlFocusInEvent do: [ hasFocus := true ].
	self when: BlFocusOutEvent do: [ hasFocus := false ]
]

{ #category : #scrolling }
BrEditorElement >> scrollToLast [
	"Scroll instantly to the last segment"
	
	self scrollToPosition: self editor segmentCollector computedSegmentsCount
]
