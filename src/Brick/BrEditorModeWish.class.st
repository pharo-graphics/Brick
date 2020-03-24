Class {
	#name : #BrEditorModeWish,
	#superclass : #BrWish,
	#instVars : [
		'mode'
	],
	#category : #'Brick-Editor - Events'
}

{ #category : #'instance creation' }
BrEditorModeWish class >> editable [
	^ self new mode: BrTextEditorEditableMode new
]

{ #category : #'instance creation' }
BrEditorModeWish class >> mode: aTextEditorMode [
	^ self new mode: aTextEditorMode
]

{ #category : #'instance creation' }
BrEditorModeWish class >> readOnlyWithSelection [
	^ self new mode: BrTextEditorReadonlyWithSelectionMode new
]

{ #category : #'instance creation' }
BrEditorModeWish class >> readOnlyWithoutSelection [
	^ self new mode: BrTextEditorReadonlyWithoutSelectionMode new
]

{ #category : #accessing }
BrEditorModeWish >> mode [
	^ mode
]

{ #category : #accessing }
BrEditorModeWish >> mode: anObject [
	mode := anObject
]
