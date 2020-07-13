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
	
	interactions := self buildEditorShortcuts: { 
		BlKeyCombination primaryA -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor selecter all select ].
		BlKeyCombination primaryC -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor copySelected ].
		BlKeyCombination escape -> [ :aShortcutEvent :aShortcut :aTextEditor | aTextEditor selectNone ]
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
