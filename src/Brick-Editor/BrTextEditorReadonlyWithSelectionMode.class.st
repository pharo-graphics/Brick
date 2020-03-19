Class {
	#name : #BrTextEditorReadonlyWithSelectionMode,
	#superclass : #BrTextEditorBasicMode,
	#category : #'Brick-Editor-Model'
}

{ #category : #initialization }
BrTextEditorReadonlyWithSelectionMode >> initialize [
	super initialize.
	
	eventHandlers := eventHandlers,
	{
		BrTextEditorMouseDownHandler uniqueInstance.
		BrTextEditorSelectionHandler new.
		BrTextEditorCursorIconHandler uniqueInstance.
	}.
	
	interactions := self buildInteractions: { 
		BlKeyCombination primaryA -> [ :aTextEditor | aTextEditor selecter all select ].
		BlKeyCombination primaryC -> [ :aTextEditor | aTextEditor copySelected ].
		BlKeyCombination escape -> [ :aTextEditor | aTextEditor selectNone ]
	}
]

{ #category : #'api - hooks' }
BrTextEditorReadonlyWithSelectionMode >> installOnEditor: aTextEditor [
	super installOnEditor: aTextEditor.

	aTextEditor segmentBuilder beReadOnly
]
