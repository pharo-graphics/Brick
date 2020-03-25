Class {
	#name : #BrEditableLabelExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Editor'
}

{ #category : #'examples - actions' }
BrEditableLabelExamples >> acceptTextInEditorMode [
	<gtExample>
	| anEditableLabel wasAccepted acceptedText |
	
	anEditableLabel := self editTextInEditorMode.

	wasAccepted := 0.
	acceptedText := ''.
	anEditableLabel when: BrEditorAcceptWish do: [ :aWish |
		acceptedText := aWish text.
		wasAccepted := wasAccepted + 1 ].
	
	anEditableLabel acceptEdition.
	
	self assert: anEditableLabel viewModel model asString equals: 'edit me'.
	self assert: anEditableLabel text asString equals: 'edit me'.
	self assert: acceptedText asString equals: 'edit me'.
	self assert: wasAccepted equals: 1.
	self assert: anEditableLabel isReadOnly.
	
	^ anEditableLabel
]

{ #category : #'examples - actions' }
BrEditableLabelExamples >> cancelTextInEditorMode [
	<gtExample>
	| anEditableLabel wasCancelled |
	
	anEditableLabel := self editTextInEditorMode.

	wasCancelled := 0.
	anEditableLabel when: BrEditorCancelWish do: [ wasCancelled := wasCancelled + 1 ].
	
	anEditableLabel cancelEdition.
	
	"the original text is restored"
	self assert: anEditableLabel viewModel model asString equals: 'Double click me'.
	self assert: anEditableLabel text asString equals: 'Double click me'.
	self assert: wasCancelled equals: 1.
	self assert: anEditableLabel isReadOnly.
	
	^ anEditableLabel
]

{ #category : #'examples - actions' }
BrEditableLabelExamples >> editTextInEditorMode [
	<gtExample>
	| anEditableLabel |

	anEditableLabel := self switchToEditor.
	
	anEditableLabel text
		deleteAll;
		append: 'edit me' asRopedText.
	
	"the original text is stored in order to be restored if edition cancelled"
	self assert: anEditableLabel viewModel model asString equals: 'Double click me'.
	self assert: anEditableLabel text asString equals: 'edit me'.
	
	^ anEditableLabel
]

{ #category : #'examples - instance creation' }
BrEditableLabelExamples >> editableLabelWithGlamorousLook [
	<gtExample>
	| anEditableLabel |

	anEditableLabel := BrEditableLabel new
		look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
		text: 'Double click me'.

	self assert: anEditableLabel isReadOnly.
	self assert: anEditableLabel text asString equals: 'Double click me'.

	^ anEditableLabel
]

{ #category : #'examples - actions' }
BrEditableLabelExamples >> switchToEditor [
	<gtExample>
	| anEditableLabel |

	anEditableLabel := self editableLabelWithGlamorousLook.
	anEditableLabel switchToEditor.
	
	self assert: anEditableLabel isEditable.
	self assert: anEditableLabel viewModel model asString equals: anEditableLabel text asString.
	
	^ anEditableLabel
]

{ #category : #'examples - actions' }
BrEditableLabelExamples >> switchToLabelWhileInEditorMode [
	<gtExample>
	| anEditableLabel |
	
	anEditableLabel := self editTextInEditorMode.
	
	anEditableLabel switchToLabel.
	
	self assert: anEditableLabel viewModel model asString equals: 'Double click me'.
	
	"manual switching to label does nothing to the current text"
	self assert: anEditableLabel text asString equals: 'edit me'.
	self assert: anEditableLabel isReadOnly.
	
	^ anEditableLabel
]
