Class {
	#name : #BrTextEditorEditableMode,
	#superclass : #BrTextEditorBasicMode,
	#category : #'Brick-Editor-Model'
}

{ #category : #initialization }
BrTextEditorEditableMode >> createEventHandlers [
	^ super createEventHandlers, {
		BrTextEditorMouseDownHandler uniqueInstance.
		BrTextEditorSelectionHandler new.
		BrTextEditorInsertionHandler new.
		BrTextEditorCursorIconHandler uniqueInstance.
	}
]

{ #category : #initialization }
BrTextEditorEditableMode >> initialize [
	super initialize.
	
	interactions := interactions, (self buildEditorShortcuts: { 
	
		BlKeyCombination delete -> [ :aShortcutEvent :aShortcut :aTextEditor |
				aTextEditor deleter
					selected;
					oneAfterCursor;
					delete ].
		
		BlKeyCombination backspace -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor deleter
				selected;
				oneBeforeCursor;
				surroundings: aTextEditor surroundMap;
				delete
		].
	
		self returnKeyAndAction.
			
		BlKeyCombination tab -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor selection isEmpty
				ifTrue: [
					aTextEditor inserter
						atCursor;
						indentation;
						insert ]
				ifFalse: [
					aTextEditor inserter
						indentation;
						beforeSelectedLines;
						withoutSelectionDelete;
						insert ] ].
		
		BlKeyCombination primaryX -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor cutSelected ].
		BlKeyCombination primaryA -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor selecter all select ].
		BlKeyCombination primaryC -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor copySelected ].
		BlKeyCombination escape -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor selectNone ].
		"Paste a text from the clipboard at the current cursor position.
		I delete any currently selected text and update cursor position"
		BlKeyCombination primaryV -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor paster
				inputFilter: aTextEditor inputFilter;
				fromClipboard;
				atCursor;
				paste ].
		BlKeyCombination primaryZ -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor undo ].
		BlKeyCombination primaryShiftZ -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor redo ].
		
		BlKeyCombination shiftArrowLeft -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor selecter
				withoutCursorUpdate;
				moveOneToLeft;
				select.
			aTextEditor navigator
				moveLeft;
				apply ].
		BlKeyCombination shiftArrowRight -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor selecter
				withoutCursorUpdate;
				moveOneToRight;
				select.
			aTextEditor navigator
				moveRight;
				apply ].
		
		BlKeyCombination shiftArrowUp -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor selecter
				withoutCursorUpdate;
				moveOneUp;
				select.
			aTextEditor navigator
				moveUp;
				withoutResettingDesiredCoordinate;
				apply ].
			
		BlKeyCombination shiftArrowDown -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor selecter
				withoutCursorUpdate;
				moveOneDown;
				select.
			aTextEditor navigator
				moveDown;
				withoutResettingDesiredCoordinate;
				apply ].
		
		"left-arrow => move cursor left and deselect everything"
		BlKeyCombination arrowLeft -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor deselecter all deselect.
			aTextEditor navigator
				moveLeft;
				apply ].
		
		"right-arrow => move cursor right and deselect everything"
		BlKeyCombination arrowRight -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor deselecter all deselect.
			aTextEditor navigator
				moveRight;
				apply ].
		
		"up-arrow => move cursor up"
		BlKeyCombination arrowUp -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor deselecter all deselect.
			aTextEditor navigator
				moveUp;
				withoutResettingDesiredCoordinate;
				apply ].
		
		"down-arrow => move cursor down"
		BlKeyCombination arrowDown -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor deselecter all deselect.
			aTextEditor navigator
				moveDown;
				withoutResettingDesiredCoordinate;
				apply ].
		
		BlKeyCombination primaryArrowLeft -> [ :aShortcutEvent :aShortcut :aTextEditor |  aTextEditor moveCursorToStartPreviousWord ].
		BlKeyCombination primaryArrowRight -> [ :aShortcutEvent :aShortcut :aTextEditor |  aTextEditor moveCursorToEndNextWord ].
		BlKeyCombination home -> [ :aShortcutEvent :aShortcut :aTextEditor |  aTextEditor moveCursorToLineStart ].
		BlKeyCombination end -> [ :aShortcutEvent :aShortcut :aTextEditor |  aTextEditor moveCursorToLineEnd ].
	})
]

{ #category : #'api - hooks' }
BrTextEditorEditableMode >> installOnEditor: aTextEditor [
	super installOnEditor: aTextEditor.

	aTextEditor segmentBuilder beEditable
]

{ #category : #testing }
BrTextEditorEditableMode >> isEditable [
	^ true
]

{ #category : #defaults }
BrTextEditorEditableMode >> returnKeyAndAction [
	^ BlKeyCombination return -> [ :aShortcutEvent :aShortcut :aTextEditor |
			aTextEditor inserter
				inputFilter: aTextEditor inputFilter;
				atCursor;
				lineEndingWithWhitespace;
				insert ].
]
