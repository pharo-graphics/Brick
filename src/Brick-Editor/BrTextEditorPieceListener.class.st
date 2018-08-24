"
I am a special text piece listener that dispatches essential command though the editor instead of manipulating text pieces directly
"
Class {
	#name : #BrTextEditorPieceListener,
	#superclass : #BlElementEventListener,
	#instVars : [
		'editor'
	],
	#category : 'Brick-Editor-UI-Handlers'
}

{ #category : #'text - modifications' }
BrTextEditorPieceListener >> deleteAt: aTextIndex in: aTextEditElement [
	| aGlobalIndex | 
	aGlobalIndex := aTextEditElement text start + aTextIndex - 1.
	
	"Can not delete text outside of text bounds"
	(aGlobalIndex between: 1 and: self editor text size)
		ifFalse: [ ^ self ].
	
	self editor delete: aGlobalIndex - 1 to: aGlobalIndex.
	self editor moveCursorTo: ((aGlobalIndex - 1) max: 0).

	aTextEditElement textChanged
]

{ #category : #accessing }
BrTextEditorPieceListener >> editor [
	^ editor
]

{ #category : #accessing }
BrTextEditorPieceListener >> editor: anObject [
	editor := anObject
]

{ #category : #'keyboard handlers' }
BrTextEditorPieceListener >> handleInsert: anEvent [
	"| aString aCursorPosition |

	aString := anEvent char asString.
	aCursorPosition := self editor cursor position	.

	self editor
		insertString: aString
		at: aCursorPosition.

	self editor moveCursorTo: aCursorPosition + aString size"
]

{ #category : #'text - modifications' }
BrTextEditorPieceListener >> insertString: aString at: aTextIndex in: aTextEditElement [
	"Insert a given string in a provided text edit element.
	The exact location of an inserted string is determined by current cursor location"
	"aTextIndex is given in local text coordinates of a single text piece (word) element.
	It should be converted to a global index of the whole text model"
	| aGlobalIndex |
	
	self
		assert: [ aTextEditElement isAttachedToSceneGraph ]
		description: [ 'Text edit piece must be attached to the scene graph!' ].

	aGlobalIndex := self localTextIndexToGlobal: aTextIndex in: aTextEditElement.
	self editor
		insertString: aString
		at: aGlobalIndex.

	self
		moveCursorRight: aTextEditElement
		by: aString size.

	aTextEditElement textChanged
]

{ #category : #'text - computing' }
BrTextEditorPieceListener >> localTextIndexToGlobal: aTextIndex in: aTextEditElement [
	"Transform a text index from local system of text edit element to global editor system"
	<return: #Number>
	
	^ (aTextEditElement text start + aTextIndex - aTextEditElement text isEmpty not asBit) max: 0
]

{ #category : #'cursor - management' }
BrTextEditorPieceListener >> moveCursorLeft: aTextEditElement by: aNumber [
	self editor moveCursorTo: self editor cursor position - aNumber
]

{ #category : #'cursor - management' }
BrTextEditorPieceListener >> moveCursorRight: aTextEditElement by: aNumber [
	self editor moveCursorTo: self editor cursor position + aNumber
]

{ #category : #'cursor - management' }
BrTextEditorPieceListener >> moveCursorTo: aTextIndex in: aTextElement [
	self editor moveCursorTo: ((aTextElement text start + aTextIndex - 1) max: 0)
]

{ #category : #'selection handlers' }
BrTextEditorPieceListener >> select: aFromIndex to: aToIndex in: aTextEditElement [
	| aGlobalFrom aGlobalTo |

	"remove previous selection"
	
	aTextEditElement selection do: [ :aMonotoneSelection |
		aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
		aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
		
		self editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ].
	
	aGlobalFrom := aTextEditElement text start + aFromIndex - 1.
	aGlobalTo := aTextEditElement text start + aToIndex - 1.
	
	self editor recordSelection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo)
]

{ #category : #'selection handlers' }
BrTextEditorPieceListener >> selectNone: aTextEditElement [
	"super selectNone: aTextEditElement."
	
	aTextEditElement selection do: [ :aMonotoneSelection |
		| aGlobalFrom aGlobalTo |

		aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
		aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
		self editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ]
]
