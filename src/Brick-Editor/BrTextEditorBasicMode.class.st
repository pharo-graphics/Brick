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
BrTextEditorBasicMode >> buildInteractions: aCollectionOfAssociations [
	<return: #Collection of: #BrTextEditorInteraction>

	^ aCollectionOfAssociations collect: [ :eachInteractionDescritpion |
		(BrTextEditorInteraction new
			combination: eachInteractionDescritpion key;
			action: eachInteractionDescritpion value) ]
]

{ #category : #initialization }
BrTextEditorBasicMode >> initialize [
	super initialize.
	
	eventHandlers := {	}.
	interactions := {}
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> installOnEditor: aTextEditor [
	super installOnEditor: aTextEditor.
	
	interactions do: [ :eachInteraction |
		aTextEditor addInteraction: eachInteraction ]
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> installOnEditorElement: anEditorElement [
	super installOnEditorElement: anEditorElement.

	eventHandlers do: [ :eachEventHandler |
		anEditorElement addEventHandler: eachEventHandler ]
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> uninstallFromEditor: aTextEditor [
	super uninstallFromEditor: aTextEditor.
	
	interactions do: [ :eachInteraction |
		aTextEditor removeInteraction: eachInteraction ]
]

{ #category : #'api - hooks' }
BrTextEditorBasicMode >> uninstallFromEditorElement: anEditorElement [
	super uninstallFromEditorElement: anEditorElement.

	eventHandlers do: [ :eachEventHandler |
		anEditorElement removeEventHandler: eachEventHandler ]
]
