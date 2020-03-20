Class {
	#name : #BrEditorModeLook,
	#superclass : #BrInteractiveLook,
	#category : #'Brick-Editor - Look'
}

{ #category : #'api - style' }
BrEditorModeLook >> editable: aBlock [
	self
		when: self state editable
		style: aBlock
]

{ #category : #'api - style' }
BrEditorModeLook >> readOnlyWithSelection: aBlock [
	self
		when: self state readOnlyWithSelection
		style: aBlock
]

{ #category : #'api - style' }
BrEditorModeLook >> readOnlyWithoutSelection: aBlock [
	self
		when: self state readOnlyWithoutSelection
		style: aBlock
]

{ #category : #'api - style' }
BrEditorModeLook >> readonly: aBlock [
	self
		when: self state readOnly
		style: aBlock
]

{ #category : #accessing }
BrEditorModeLook >> state [
	^ BrEditorModeState
]
