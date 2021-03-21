Class {
	#name : #BrTextEditorBasicMode,
	#superclass : #BrTextEditorMode,
	#instVars : [
		'eventHandlers',
		'shortcuts'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #initialization }
BrTextEditorBasicMode >> createEventHandlers [
	^ #()
]

{ #category : #initialization }
BrTextEditorBasicMode >> eventHandlers [
	^ eventHandlers ifNil: [ eventHandlers := self createEventHandlers ]
]

{ #category : #initialization }
BrTextEditorBasicMode >> initialize [
	super initialize.
	
	"initialized lazily"
	eventHandlers := nil.

	shortcuts := {}
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> installOnEditor: aTextEditor [
	super installOnEditor: aTextEditor.
	
	shortcuts do: [ :eachInteraction |
		aTextEditor addEditorShortcut: eachInteraction ]
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> installOnEditorElement: anEditorElement [
	super installOnEditorElement: anEditorElement.

	self eventHandlers do: [ :eachEventHandler |
		anEditorElement addEventHandler: eachEventHandler ]
]

{ #category : #copying }
BrTextEditorBasicMode >> postCopy [
	"they will be initialized lazily later"
	eventHandlers := nil.
	shortcuts := shortcuts copy
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> uninstallFromEditor: aTextEditor [
	super uninstallFromEditor: aTextEditor.
	
	shortcuts do: [ :eachInteraction |
		aTextEditor removeEditorShortcut: eachInteraction ]
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> uninstallFromEditorElement: anEditorElement [
	super uninstallFromEditorElement: anEditorElement.

	self eventHandlers do: [ :eachEventHandler |
		anEditorElement removeEventHandler: eachEventHandler ]
]

{ #category : #initialization }
BrTextEditorBasicMode >> withShortcuts: aCollectionOfShortcuts [
	shortcuts := shortcuts, aCollectionOfShortcuts
]
