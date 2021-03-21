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

{ #category : #'examples - scripter' }
BrEditableLabelExamples >> scripter_01_initial [
	<gtExample>
	| aScripter |
	
	aScripter := BlDevScripter new.
	aScripter
		substep: 'Add editable label'
		do: [ :aStep | 
			aStep set
				label: 'Editable label';
				element: [ self editableLabelWithGlamorousLook ] ].
	
	^ aScripter syncContinue
]

{ #category : #'examples - scripter' }
BrEditableLabelExamples >> scripter_02_double_click_to_edit [
	<gtExample>
	| aScripter |
	
	aScripter := self scripter_01_initial.
	aScripter
		substep: 'Switch to the edit mode'
		do: [ :aStep |
			aStep check
				label: 'Check read-only state';
				satisfies: [ :anEditableLabel | anEditableLabel states hasState: BrEditorModeState readOnlyWithoutSelection ].
			
			aStep doubleClick.
			
			aStep check
				label: 'Check edit mode';
				satisfies: [ :anEditableLabel | anEditableLabel isEditable ].
				
			aStep check
				label: 'Check edit state';
				satisfies: [ :anEditableLabel | anEditableLabel states hasState: BrEditorModeState editable ].
				
			aStep check
				label: 'Check has focus';
				satisfies: [ :anEditableLabel | anEditableLabel isFocused ] ].

	^ aScripter syncContinue
]

{ #category : #'examples - scripter' }
BrEditableLabelExamples >> scripter_03_press_esc_to_cancel_changes [
	<gtExample>
	| aScripter |
	
	aScripter := self scripter_02_double_click_to_edit.
	aScripter
		substep: 'Switch back to readonly'
		do: [ :aStep |
			aStep keyClick: BlKeyboardKey escape.

			aStep check
				label: 'Check readonly mode';
				satisfies: [ :anEditableLabel | anEditableLabel isReadOnly ].

			aStep check
				label: 'Check still has focus';
				satisfies: [ :anEditableLabel | anEditableLabel isFocused ] ].

	^ aScripter syncContinue
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
