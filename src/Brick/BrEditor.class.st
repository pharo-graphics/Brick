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

{ #category : #'api - editor' }
BrEditor >> addEditorShortcut: aBrTextEditorInteraction [
	self editor addEditorShortcut: aBrTextEditorInteraction
]

{ #category : #'api - editor' }
BrEditor >> beEditable [
	self dispatchEvent: (BrEditorModeWish editable)
]

{ #category : #'api - editor' }
BrEditor >> beMode: aTextEditorMode [
	self dispatchEvent: (BrEditorModeWish mode: aTextEditorMode)
]

{ #category : #'api - editor' }
BrEditor >> beReadOnlyWithSelection [
	self dispatchEvent: (BrEditorModeWish readOnlyWithSelection)
]

{ #category : #'api - editor' }
BrEditor >> beReadOnlyWithoutSelection [
	self dispatchEvent: (BrEditorModeWish readOnlyWithoutSelection)
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

{ #category : #initialization }
BrEditor >> initialize [
	super initialize.
	
	self editor: BrTextEditor new.
	self padding: (BlInsets all: 5).
	
	self viewModel: (editorModel := BrEditorModel new
			add: (BrInteractiveModel withAll: {
				BrEditorModeModel editable.
				BrFocusModel new.
				BrHoverModel new.
				BrPressModel new.
				BrSelectModel new.
				BrLayoutHorizontalResizerModel matchParent.
				BrLayoutVerticalResizerModel matchParent }))
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
	| aRequest |

	self dispatchEvent: (aRequest := BrEditorModeRequest new oneWay).
	^ aRequest response mode isEditable
]

{ #category : #'api - editor' }
BrEditor >> isReadOnly [
	<return: #Boolean>
	| aRequest |

	self dispatchEvent: (aRequest := BrEditorModeRequest new oneWay).
	^ aRequest response mode isReadOnly
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
	editorModel styler: aStyler.
]

{ #category : #'editor - accessing' }
BrEditor >> text [
	"Return a text I work with. All modifications to a text must be done from UI thread"
	<return: #BlText>

	^ editorModel text
]

{ #category : #'editor - accessing' }
BrEditor >> text: aBlText [
	editorModel text: aBlText asRopedText
]
