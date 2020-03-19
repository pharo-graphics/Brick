Class {
	#name : #BrTextEditorReadonlyWithoutSelectionMode,
	#superclass : #BrTextEditorBasicMode,
	#category : #'Brick-Editor-Model'
}

{ #category : #'api - hooks' }
BrTextEditorReadonlyWithoutSelectionMode >> installOnEditor: aTextEditor [
	super installOnEditor: aTextEditor.

	aTextEditor segmentBuilder beReadOnly
]
