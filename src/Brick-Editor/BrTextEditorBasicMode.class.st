Class {
	#name : #BrTextEditorBasicMode,
	#superclass : #BrTextEditorMode,
	#instVars : [
		'eventHandlers',
		'interactions'
	],
	#category : #'Brick-Editor-Model'
}

{ #category : #initialization }
BrTextEditorBasicMode >> buildEditorShortcuts: aCollectionOfAssociations [
	<return: #Collection of: #BrTextEditorShortcut>

	^ aCollectionOfAssociations collect: [ :eachShortcutDescription |
		(BrTextEditorShortcut new
			combination: eachShortcutDescription key;
			action: eachShortcutDescription value) ]
]

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

	interactions := {}
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> installOnEditor: aTextEditor [
	super installOnEditor: aTextEditor.
	
	interactions do: [ :eachInteraction |
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
	interactions := interactions copy
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> uninstallFromEditor: aTextEditor [
	super uninstallFromEditor: aTextEditor.
	
	interactions do: [ :eachInteraction |
		aTextEditor removeEditorShortcut: eachInteraction ]
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> uninstallFromEditorElement: anEditorElement [
	super uninstallFromEditorElement: anEditorElement.

	self eventHandlers do: [ :eachEventHandler |
		anEditorElement removeEventHandler: eachEventHandler ]
]

{ #category : #initialization }
BrTextEditorBasicMode >> withInteractions: aCollectionOfDefinitions [
	interactions := interactions, (self buildEditorShortcuts: aCollectionOfDefinitions)
]
