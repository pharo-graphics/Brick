Class {
	#name : #BrEditor,
	#superclass : #BrEditorElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#category : #'Brick-Editor-UI'
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
	
	self viewModel: (BrInteractiveModel withAll: {
		BrLayoutHorizontalResizerModel matchParent.
		BrLayoutVerticalResizerModel fitContent }).

	self look: (BrLayoutResizerLook inherit)
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
	^ self editor styler
]

{ #category : #'editor - accessing' }
BrEditor >> styler: aStyler [
	self editor styler: aStyler
]

{ #category : #'editor - accessing' }
BrEditor >> text [
	^ self editor text
]

{ #category : #'editor - accessing' }
BrEditor >> text: aBlText [
	self editor text: aBlText asRopedText
]
