Class {
	#name : #BrTextEditorReadonlyWithSelectionMode,
	#superclass : #BrTextEditorBasicMode,
	#category : #'Brick-Editor-Model'
}

{ #category : #initialization }
BrTextEditorReadonlyWithSelectionMode >> createEventHandlers [
	^ super createEventHandlers, {
		BrTextEditorMouseDownHandler uniqueInstance.
		BrTextEditorSelectionHandler new.
		BrTextEditorCursorIconHandler uniqueInstance.
	}
]

{ #category : #initialization }
BrTextEditorReadonlyWithSelectionMode >> initialize [
	super initialize.
	
	shortcuts := {
		BrEditorCopyShortcut new.
		BrEditorSelectAllShortcut new.
		BrEditorDeselectAllShortcut new.
	}
]

{ #category : #'api - hooks' }
BrTextEditorReadonlyWithSelectionMode >> installOnEditor: aTextEditor [
	super installOnEditor: aTextEditor.

	aTextEditor segmentBuilder beReadOnly
]

{ #category : #testing }
BrTextEditorReadonlyWithSelectionMode >> isReadOnly [
	^ true
]
