Class {
	#name : #BrTextEditorReadonlyMode,
	#superclass : #BrTextEditorBasicMode,
	#category : #'Brick-Editor-Model'
}

{ #category : #'api - hooks' }
BrTextEditorReadonlyMode >> installOnEditor: aTextEditor [
	super installOnEditor: aTextEditor.

	aTextEditor segmentBuilder beReadOnly
]
