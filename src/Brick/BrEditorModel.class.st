Class {
	#name : #BrEditorModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'styler',
		'text'
	],
	#category : #'Brick-Editor - Model'
}

{ #category : #initialization }
BrEditorModel >> initialize [
	super initialize.
	
	styler := BlTextNullStyler new.
	text := '' asRopedText
]

{ #category : #initialization }
BrEditorModel >> initializeListeners [
	super initializeListeners.
	
	self when: BrEditorStylerRequest reply: [ :aResponse | aResponse styler: self styler ].
	self when: BrEditorTextRequest reply: [ :aResponse | aResponse text: self text ]
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
	styler := aStyler.
	self notifyStylerChanged
]

{ #category : #accessing }
BrEditorModel >> text [
	^ text
]

{ #category : #accessing }
BrEditorModel >> text: aText [
	text := aText.
	self notifyTextChanged
]
