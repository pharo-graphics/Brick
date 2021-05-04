Class {
	#name : #BrEditorModeAptitude,
	#superclass : #BrInteractiveAptitude,
	#category : #'Brick-Editor - Look'
}

{ #category : #'api - style' }
BrEditorModeAptitude >> editable: aBlock [
	self
		when: self state editable
		style: aBlock
]

{ #category : #'api - style' }
BrEditorModeAptitude >> editableFocused: aStyleBlock [
	self
		when: (self state editable and: BrInteractionState focused)
		style: aStyleBlock
]

{ #category : #'api - style' }
BrEditorModeAptitude >> editableUnfocused: aStyleBlock [
	self
		when: (self state editable and: BrInteractionState unfocused)
		style: aStyleBlock
]

{ #category : #'api - style' }
BrEditorModeAptitude >> readOnly: aBlock [
	self
		when: self state readOnly
		style: aBlock
]

{ #category : #'api - style' }
BrEditorModeAptitude >> readOnlyWithSelection: aBlock [
	self
		when: self state readOnlyWithSelection
		style: aBlock
]

{ #category : #'api - style' }
BrEditorModeAptitude >> readOnlyWithoutSelection: aBlock [
	self
		when: self state readOnlyWithoutSelection
		style: aBlock
]

{ #category : #accessing }
BrEditorModeAptitude >> state [
	^ BrEditorModeState
]
