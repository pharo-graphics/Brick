Class {
	#name : #BrEditorModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'styler',
		'text',
		'mode'
	],
	#category : #'Brick-Editor - Model'
}

{ #category : #accessing }
BrEditorModel >> beEditable [
	self mode: BrTextEditorEditableMode new
]

{ #category : #initialization }
BrEditorModel >> initialize [
	super initialize.
	
	styler := BlTextNullStyler new.
	text := '' asRopedText.
	mode := BrTextEditorEditableMode new
]

{ #category : #initialization }
BrEditorModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrEditorStylerRequest reply: [ :aResponse | aResponse styler: self styler ].
	self when: BrEditorTextRequest reply: [ :aResponse | aResponse text: self text ].
	self when: BrEditorModeRequest reply: [ :aResponse | aResponse mode: self mode ].
]

{ #category : #accessing }
BrEditorModel >> mode [
	<return: #BrTextEditorMode>

	^ mode
]

{ #category : #accessing }
BrEditorModel >> mode: aBrTextEditorMode [
	mode = aBrTextEditorMode
		ifTrue: [ ^ self ].

	mode := aBrTextEditorMode.
	self notifyModeChanged
]

{ #category : #notifying }
BrEditorModel >> notifyModeChanged [
	self dispatchEvent: (BrEditorModeChanged new mode: self mode)
]

{ #category : #notifying }
BrEditorModel >> notifyStylerChanged [
	self dispatchEvent: (BrEditorStylerChanged styler: self styler)
]

{ #category : #notifying }
BrEditorModel >> notifyTextChanged [
	self dispatchEvent: (BrEditorTextChanged text: self text)
]

{ #category : #accessing }
BrEditorModel >> styler [
	^ styler
]

{ #category : #accessing }
BrEditorModel >> styler: aStyler [
	styler = aStyler
		ifTrue: [ ^ self ].

	styler := aStyler.
	self notifyStylerChanged
]

{ #category : #accessing }
BrEditorModel >> text [
	^ text
]

{ #category : #accessing }
BrEditorModel >> text: aText [
	text == aText
		ifTrue: [ ^ self ].

	text := aText.
	self notifyTextChanged
]
