Class {
	#name : #BrTextEditorEditableMode,
	#superclass : #BrTextEditorBasicMode,
	#category : #'Brick-Editor-Model'
}

{ #category : #initialization }
BrTextEditorEditableMode >> initialize [
	super initialize.
	
	eventHandlers := eventHandlers,
	{
		BrTextEditorMouseDownHandler uniqueInstance.
		BrTextEditorSelectionHandler new.
		BrTextEditorInsertionHandler new.
		BrTextEditorCursorIconHandler uniqueInstance.
	}.
	
	interactions := interactions, (self buildInteractions: { 
	
		BlKeyCombination delete -> [ :aTextEditor |
				aTextEditor deleter
					selected;
					oneAfterCursor;
					delete ].
		
		BlKeyCombination backspace -> [ :aTextEditor |
			aTextEditor deleter
				selected;
				oneBeforeCursor;
				surroundings: aTextEditor surroundMap;
				delete
		].
	
		BlKeyCombination return -> [ :aTextEditor |
			aTextEditor inserter
				inputFilter: aTextEditor inputFilter;
				atCursor;
				lineEndingWithWhitespace;
				insert ].
			
		BlKeyCombination tab -> [ :aTextEditor |
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
		
		BlKeyCombination primaryX -> [ :aTextEditor | aTextEditor cutSelected ].
		BlKeyCombination primaryA -> [ :aTextEditor | aTextEditor selecter all select ].
		BlKeyCombination primaryC -> [ :aTextEditor | aTextEditor copySelected ].
		BlKeyCombination escape -> [ :aTextEditor | aTextEditor selectNone ].
		"Paste a text from the clipboard at the current cursor position.
		I delete any currently selected text and update cursor position"
		BlKeyCombination primaryV -> [ :aTextEditor |
			aTextEditor paster
				inputFilter: aTextEditor inputFilter;
				fromClipboard;
				atCursor;
				paste ].
		BlKeyCombination primaryZ -> [ :aTextEditor | aTextEditor undo ].
		BlKeyCombination primaryShiftZ -> [ :aTextEditor | aTextEditor redo ].
		
		BlKeyCombination shiftArrowLeft -> [ :aTextEditor |
			aTextEditor selecter
				withoutCursorUpdate;
				moveOneToLeft;
				select.
			aTextEditor navigator
				moveLeft;
				apply ].
		BlKeyCombination shiftArrowRight -> [ :aTextEditor |
			aTextEditor selecter
				withoutCursorUpdate;
				moveOneToRight;
				select.
			aTextEditor navigator
				moveRight;
				apply ].
		
		BlKeyCombination shiftArrowUp -> [ :aTextEditor |
			aTextEditor selecter
				withoutCursorUpdate;
				moveOneUp;
				select.
			aTextEditor navigator
				moveUp;
				withoutResettingDesiredCoordinate;
				apply ].
			
		BlKeyCombination shiftArrowDown -> [ :aTextEditor |
			aTextEditor selecter
				withoutCursorUpdate;
				moveOneDown;
				select.
			aTextEditor navigator
				moveDown;
				withoutResettingDesiredCoordinate;
				apply ].
		
		"left-arrow => move cursor left and deselect everything"
		BlKeyCombination arrowLeft -> [ :aTextEditor |
			aTextEditor deselecter all deselect.
			aTextEditor navigator
				moveLeft;
				apply ].
		
		"right-arrow => move cursor right and deselect everything"
		BlKeyCombination arrowRight -> [ :aTextEditor |
			aTextEditor deselecter all deselect.
			aTextEditor navigator
				moveRight;
				apply ].
		
		"up-arrow => move cursor up"
		BlKeyCombination arrowUp -> [ :aTextEditor |
			aTextEditor deselecter all deselect.
			aTextEditor navigator
				moveUp;
				withoutResettingDesiredCoordinate;
				apply ].
		
		"down-arrow => move cursor down"
		BlKeyCombination arrowDown -> [ :aTextEditor |
			aTextEditor deselecter all deselect.
			aTextEditor navigator
				moveDown;
				withoutResettingDesiredCoordinate;
				apply ].
		
		BlKeyCombination primaryArrowLeft -> [ :aTextEditor |  aTextEditor moveCursorToStartPreviousWord ].
		BlKeyCombination primaryArrowRight -> [ :aTextEditor |  aTextEditor moveCursorToEndNextWord ].
		BlKeyCombination home -> [ :aTextEditor |  aTextEditor moveCursorToLineStart ].
		BlKeyCombination end -> [ :aTextEditor |  aTextEditor moveCursorToLineEnd ].
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
