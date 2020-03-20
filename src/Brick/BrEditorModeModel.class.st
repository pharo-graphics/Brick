Class {
	#name : #BrEditorModeModel,
	#superclass : #BrStateModel,
	#instVars : [
		'mode'
	],
	#category : #'Brick-Editor - Model'
}

{ #category : #'instance creation' }
BrEditorModeModel class >> editable [
	^ self new beEditable
]

{ #category : #'api - mode' }
BrEditorModeModel >> beEditable [
	self mode: BrTextEditorEditableMode new
]

{ #category : #initialization }
BrEditorModeModel >> initialize [
	super initialize.

	mode := BrTextEditorNullMode new
]

{ #category : #initialization }
BrEditorModeModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrEditorModeRequest reply: [ :aResponse | aResponse mode: self mode ].
	self when: BrEditorModeWish do: [ :aWish | self mode: aWish mode ]
]

{ #category : #accessing }
BrEditorModeModel >> mode [
	<return: #BrTextEditorMode>

	^ mode
]

{ #category : #accessing }
BrEditorModeModel >> mode: aBrTextEditorMode [
	mode = aBrTextEditorMode
		ifTrue: [ ^ self ].

	mode := aBrTextEditorMode.
	self notifyStateChanged: aBrTextEditorMode
]

{ #category : #'state - accessing' }
BrEditorModeModel >> stateChangedEventClass [
	^ BrEditorModeChanged
]

{ #category : #'state - streaming' }
BrEditorModeModel >> streamStateIn: aBrInteractionStatesMapping [
	aBrInteractionStatesMapping
		addState: (BrEditorModeState mode: self mode class)
		model: self
]
