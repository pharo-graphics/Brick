Class {
	#name : #BrTextEditorMode,
	#superclass : #Object,
	#category : #'Brick-Editor-Model'
}

{ #category : #comparing }
BrTextEditorMode >> = anObject [
	self == anObject ifTrue: [ ^ true ].
	^ self class = anObject class
]

{ #category : #comparing }
BrTextEditorMode >> hash [
	^ self hash class
]

{ #category : #'api - hooks' }
BrTextEditorMode >> installOnEditor: aTextEditor [
]

{ #category : #'api - hooks' }
BrTextEditorMode >> installOnEditorElement: aTextEditorElement [
]

{ #category : #'api - hooks' }
BrTextEditorMode >> uninstallFromEditor: aTextEditor [
]

{ #category : #'api - hooks' }
BrTextEditorMode >> uninstallFromEditorElement: aTextEditor [
]
