Class {
	#name : #BrTextEditorMementoExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples-Model'
}

{ #category : #'examples - memento' }
BrTextEditorMementoExamples >> editorRestoreState [
	<gtExample>
	| aMemento aTextEditor |
	
	aMemento := self editorSaveState.
	aTextEditor := self newTextEditor.
	
	aTextEditor restoreState: aMemento.
	
	^ aTextEditor
]

{ #category : #'examples - memento' }
BrTextEditorMementoExamples >> editorSaveState [
	<gtExample>
	| aTextEditor aMemento |
	
	aTextEditor := self textEditorWithState.
	aMemento := aTextEditor saveState.
	
	^ aMemento
]

{ #category : #'instance creation' }
BrTextEditorMementoExamples >> newTextEditor [
	<gtExample>
	| aTextEditor |

	aTextEditor := BrTextEditor new.
	^ aTextEditor
]

{ #category : #'instance creation' }
BrTextEditorMementoExamples >> textEditorWithState [
	<gtExample>
	| aTextEditor |

	aTextEditor := BrTextEditor new
		text: 'Hello world' asRopedText glamorousCodeFontAndSize.
	
	aTextEditor navigator
		addAt: 1;
		addAt: 9;
		apply.	

	aTextEditor selecter
		from: 3 to: 8;
		withoutCursorUpdate;
		select.
	
	^ aTextEditor
]
