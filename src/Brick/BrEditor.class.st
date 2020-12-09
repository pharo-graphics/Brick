Class {
	#name : #BrEditor,
	#superclass : #BrEditorElement,
	#traits : 'TBrLayoutResizable',
	#classTraits : 'TBrLayoutResizable classTrait',
	#instVars : [
		'textReplacedHandler'
	],
	#category : #'Brick-Editor - UI'
}

{ #category : #'api - editor' }
BrEditor >> addEditorShortcut: aBrTextEditorInteraction [
	self editor addEditorShortcut: aBrTextEditorInteraction
]

{ #category : #'api - editor' }
BrEditor >> beEditable [
	self beMode: BrTextEditorEditableMode new
]

{ #category : #'api - editor' }
BrEditor >> beMode: aTextEditorMode [
	self viewModel mode: aTextEditorMode
]

{ #category : #'api - editor' }
BrEditor >> beReadOnlyWithSelection [
	self beMode: BrTextEditorReadonlyWithSelectionMode new
]

{ #category : #'api - editor' }
BrEditor >> beReadOnlyWithoutSelection [
	self beMode: BrTextEditorReadonlyWithoutSelectionMode new
]

{ #category : #'editor - accessing' }
BrEditor >> cursors [
	<return: #BrTextEditorCursor>
	^ self editor cursors
]

{ #category : #'editor - operations' }
BrEditor >> deleter [
	<return: #BrTextEditorDeleter>

	^ self editor deleter
]

{ #category : #'editor - operations' }
BrEditor >> deselecter [
	<return: #BrTextEditorDeselecter>

	^ self editor deselecter
]

{ #category : #accessing }
BrEditor >> editor: aBrTextEditor [
	self editor removeEventHandler: textReplacedHandler.

	super editor: aBrTextEditor.

	aBrTextEditor addEventHandler: textReplacedHandler
]

{ #category : #initialization }
BrEditor >> initialize [
	super initialize.
	
	self matchParent.

	textReplacedHandler := BlEventHandler
		on: BrTextEditorTextReplacedEvent
		"we intentionally set text directly to the viewModel
		to prevent any possible #asRopedText convertion"
		do: [ :anEvent | self viewModel text: anEvent text ].

	self editor: BrTextEditor new.
	self padding: (BlInsets all: 5).
	
	self viewModel: BrEditorModel new
]

{ #category : #'api - editor' }
BrEditor >> inputFilter: aBrTextEditorInputFilter [
	self editor inputFilter: aBrTextEditorInputFilter
]

{ #category : #'editor - operations' }
BrEditor >> inserter [
	<return: #BrTextEditorInserter>

	^ self editor inserter
]

{ #category : #'api - editor' }
BrEditor >> isEditable [
	<return: #Boolean>

	^ self viewModel mode isEditable
]

{ #category : #'api - editor' }
BrEditor >> isReadOnly [
	<return: #Boolean>

	^ self viewModel mode isReadOnly
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
	^ self viewModel styler
]

{ #category : #'editor - accessing' }
BrEditor >> styler: aStyler [
	self viewModel styler: aStyler
]

{ #category : #'editor - accessing' }
BrEditor >> text [
	"Return a text I work with. All modifications to a text must be done from UI thread"
	<return: #BlText>

	^ self viewModel text
]

{ #category : #'editor - accessing' }
BrEditor >> text: aBlText [
	self viewModel text: aBlText asRopedText
]
