Class {
	#name : #BrEditableLabel,
	#superclass : #BrEditor,
	#instVars : [
		'editorShortcuts',
		'labelShortcuts'
	],
	#category : #'Brick-Editor - UI'
}

{ #category : #'api - editor' }
BrEditableLabel >> acceptEdition [
	"Accept editor changes and switch back to the label"

	self isEditable
		ifFalse: [ ^ self ].

	"we should switch to label before we process acceptance, otherwise we may end up in the infinite loop"
	self switchToLabel.

	self onEditionAccepted: self text
]

{ #category : #'api - editor' }
BrEditableLabel >> cancelEdition [
	"Cancel editor changes and switch back to the label"

	self isEditable
		ifFalse: [ ^ self ].

	"we should switch to label before we process cancelation, otherwise we may end up in the infinite loop"
	self switchToLabel.

	self onEditionCancelled
]

{ #category : #initialization }
BrEditableLabel >> defaultEditorShortcuts [
	^ {
		BrEditableLabelAcceptShortcut new.
		BrEditableLabelCancelShortcut new
	}
]

{ #category : #initialization }
BrEditableLabel >> defaultLabelShortcuts [
	^ {
		BrEditorLoseFocusShortcut new.
		BrEditorFocusPreviousShortcut new.
		BrEditorFocusNextShortcut new.
		BrEditableLabelSwitchToEditorShortcut new
	}
]

{ #category : #'api - focus' }
BrEditableLabel >> focusNext [	
	self
		nextSiblingSuchThat: [ :eachElement | eachElement isFocusable ]
		do: [ :anElement | anElement requestFocus ]
]

{ #category : #'api - focus' }
BrEditableLabel >> focusPrevious [
	self
		previousSiblingSuchThat: [ :eachElement | eachElement isFocusable ]
		do: [ :anElement | anElement requestFocus ]
]

{ #category : #initialization }
BrEditableLabel >> initialize [
	super initialize.

	labelShortcuts := self defaultLabelShortcuts.
	editorShortcuts := self defaultEditorShortcuts.

	self fitContent.

	self
		when: BlDoubleClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget switchToEditor ].
		
	self
		when: BlClickEvent
		do: [ :anEvent |
			anEvent consumed: true.
			anEvent currentTarget requestFocus ].

	self
		when: BlBlurEvent
		do: [ :anEvent |
			anEvent isDueToRemoval
				ifFalse: [ anEvent currentTarget acceptEdition ] ].

	self switchToLabel
]

{ #category : #'private - hooks' }
BrEditableLabel >> onEditionAccepted: aText [
	self viewModel model: aText copy.
	self dispatchEvent: (BrEditorAcceptWish new text: aText)
]

{ #category : #'private - hooks' }
BrEditableLabel >> onEditionCancelled [
	self text: self viewModel model copy.
	self dispatchEvent: (BrEditorCancelWish new)
]

{ #category : #'api  - mode' }
BrEditableLabel >> switchToEditor [
	"Switch to editor mode selecting the whole text"

	self selecter
		all;
		select.
		
	self viewModel model: self text copy.
	self beMode: (BrTextEditorEditableMode new withShortcuts: editorShortcuts)
]

{ #category : #'api  - mode' }
BrEditableLabel >> switchToLabel [
	"Switch to the label mode deselecting the text"

	self deselecter
		all;
		deselect.

	self beMode: (BrTextEditorReadonlyWithoutSelectionMode new withShortcuts: labelShortcuts)
]

{ #category : #'api - interactions' }
BrEditableLabel >> whenKey: aCombination editorDo: anAction [
	"Add a new editor mode interaction defined by a key combination and action"
	| aNewShortcut |
	
	aNewShortcut := BlShortcutWithAction new
		combination: aCombination;
		action: anAction.
	
	editorShortcuts := editorShortcuts copyWith: aNewShortcut.
	
	self isEditable
		ifTrue: [ self addEditorShortcut: aNewShortcut ]
]

{ #category : #'api - interactions' }
BrEditableLabel >> whenKey: aCombination labelDo: anAction [
	"Add a new label mode interaction defined by a key combination and action"
	| aNewShortcut |
	
	aNewShortcut := BlShortcutWithAction new
		combination: aCombination;
		action: anAction.

	labelShortcuts := labelShortcuts copyWith: aNewShortcut.
	
	self isReadOnly
		ifTrue: [ self addEditorShortcut: aNewShortcut ]
]
