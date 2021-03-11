Class {
	#name : #BrTextEditorEditableMode,
	#superclass : #BrTextEditorBasicMode,
	#category : #'Brick-Editor-Model'
}

{ #category : #initialization }
BrTextEditorEditableMode >> createEventHandlers [
	^ super createEventHandlers, {
		BrTextEditorMouseDownHandler uniqueInstance.
		BrTextEditorDoubleClickHandler uniqueInstance.
		BrTextEditorSelectionHandler new.
		BrTextEditorInsertionHandler uniqueInstance.
		BrTextEditorCursorIconHandler uniqueInstance.
	}
]

{ #category : #initialization }
BrTextEditorEditableMode >> initialize [
	super initialize.

	shortcuts := shortcuts, {
		BrEditorDeleteOneLetterAfterCursorShortcut new.
		BrEditorDeleteOneLetterBeforeCursorShortcut new.
		BrEditorShiftRightShortcut new.
		BrEditorCutShortcut new.
		BrEditorCopyShortcut new.
		BrEditorPasteShortcut new.
		BrEditorUndoShortcut new.
		BrEditorRedoShortcut new.
	
		self returnKeyAndAction.
		
		BrEditorMoveCursorLeftShortcut new.
		BrEditorMoveCursorRightShortcut new.
		BrEditorMoveCursorUpShortcut new.
		BrEditorMoveCursorDownShortcut new.
		BrEditorMoveCursorToPreviousWordShortcut new.
		BrEditorMoveCursorToNextWordShortcut new.
		BrEditorMoveCursorToLineStartShortcut new.
		BrEditorMoveCursorToLineEndShortcut new.
		
		BrEditorSelectAllShortcut new.
		BrEditorDeselectAllShortcut new.
		BrEditorSelectLetterAfterCursorShortcut new.
		BrEditorSelectLetterBeforeCursorShortcut new.
		BrEditorSelectLineAfterCursorShortcut new.
		BrEditorSelectLineBeforeCursorShortcut new.
	}
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
	^ BrEditorLineEndingShortcut new
]
