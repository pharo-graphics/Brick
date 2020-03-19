Class {
	#name : #BrEditorExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Editor'
}

{ #category : #'examples - modes' }
BrEditorExamples >> editableEditorWithGlamorousRegularLook [
	<gtExample>
	
	^ BrEditor new
		look: BrGlamorousRegularEditorLook new;
		beEditable;
		text: String loremIpsum
]

{ #category : #'examples - editor' }
BrEditorExamples >> editorWithGlamorousRegularLook [
	<gtExample>
	
	^ BrEditor new
		look: BrGlamorousRegularEditorLook new;
		text: String loremIpsum
]

{ #category : #'examples - modes' }
BrEditorExamples >> readOnlyWithSelectionEditorWithGlamorousRegularLook [
	<gtExample>
	
	^ BrEditor new
		look: BrGlamorousRegularEditorLook new;
		beReadOnlyWithSelection;
		text: String loremIpsum
]

{ #category : #'examples - modes' }
BrEditorExamples >> readOnlyWithoutSelectionEditorWithGlamorousRegularLook [
	<gtExample>
	
	^ BrEditor new
		look: BrGlamorousRegularEditorLook new;
		beReadOnlyWithoutSelection;
		text: String loremIpsum
]
