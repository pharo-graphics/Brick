Class {
	#name : #BrEditor,
	#superclass : #BrEditorElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'editorModel'
	],
	#category : #'Brick-Editor - UI'
}

{ #category : #'editor - accessing' }
BrEditor >> cursors [
	<return: #BrTextEditorMultipleCursor>
	
	^ self editor cursor
]

{ #category : #'editor - operations' }
BrEditor >> deleter [
	<return: #BrTextEditorDeleter>

	^ self editor deleter
]

{ #category : #initialization }
BrEditor >> initialize [
	super initialize.
	
	self editor: BrTextEditor new.
	self padding: (BlInsets all: 5).
	
	self viewModel: (editorModel := BrEditorModel new
			add: (BrInteractiveModel withAll: {
				BrLayoutHorizontalResizerModel matchParent.
				BrLayoutVerticalResizerModel matchParent }))
]

{ #category : #'editor - operations' }
BrEditor >> inserter [
	<return: #BrTextEditorInserter>

	^ self editor inserter
]

{ #category : #'editor - operations' }
BrEditor >> navigator [
	<return: #BrTextEditorNavigator>

	^ self editor navigator
]

{ #category : #'editor - operations' }
BrEditor >> selecter [
	<return: #BrTextEditorSelecter>

	^ self editor selecter
]

{ #category : #'editor - accessing' }
BrEditor >> selection [
	<return: #BlSelection>

	^ self editor selection
]

{ #category : #'editor - accessing' }
BrEditor >> styler [
	^ editorModel styler
]

{ #category : #'editor - accessing' }
BrEditor >> styler: aStyler [
	editorModel styler: aStyler
]

{ #category : #'editor - accessing' }
BrEditor >> text [
	^ editorModel text
]

{ #category : #'editor - accessing' }
BrEditor >> text: aBlText [
	editorModel text: aBlText asRopedText
]
