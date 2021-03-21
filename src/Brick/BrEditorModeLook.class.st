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
BrEditorModeLook >> editableFocused: aStyleBlock [
	self
		when: (self state editable and: BrInteractionState focused)
		style: aStyleBlock
]

{ #category : #'api - style' }
BrEditorModeLook >> editableUnfocused: aStyleBlock [
	self
		when: (self state editable and: BrInteractionState unfocused)
		style: aStyleBlock
]

{ #category : #'api - style' }
BrEditorModeLook >> readOnly: aBlock [
	self
		when: self state readOnly
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

{ #category : #accessing }
BrEditorModeLook >> state [
	^ BrEditorModeState
]
