"
I represent a UML class element

Example:

[[[example=GtDiagrammerUmlClassElementExamples>>#withAttributesAndMethods|expanded=true|show=gtLiveIn:]]]
"
Class {
	#name : #BrUmlClassElement,
	#superclass : #BlElement,
	#category : 'Brick-UML - Stencil'
}

{ #category : #'instance creation' }
BrUmlClassElement class >> new [
	^ self withDefaultContainer
]

{ #category : #'instance creation' }
BrUmlClassElement class >> withContainers: aCollectionOfSymbols [
	^ self basicNew
		initialize;
		newContainers: aCollectionOfSymbols
]

{ #category : #'instance creation' }
BrUmlClassElement class >> withDefaultContainer [
	^ self withContainers: #(label default)
]

{ #category : #accessing }
BrUmlClassElement >> attributes: aCollectionOfAttributes in: aContainerSymbol [
	"Change a text within a container given by its name"
	
	self
		editorIn: aContainerSymbol
		do: [ :anEditorElement |
			| anEditor |
			anEditor := anEditorElement editor.
			anEditor text: (anEditor text attributes: aCollectionOfAttributes) ]
]

{ #category : #'private - accessing' }
BrUmlClassElement >> editorIn: aContainerSymbol do: aBlock [
	"Search for an editor inside of a container by its name
	and evaluate a block if such an editor is found"

	self
		childNamed: aContainerSymbol
		ifFound: [ :aContainer |
			aContainer
				childNamed: #editor
				ifFound: aBlock
			ifNone: #yourself ]
		ifNone: #yourself
]

{ #category : #initialization }
BrUmlClassElement >> initialize [
	super initialize.
	
	self size: 200@300.
	self layout: BlLinearLayout vertical.
	self border: (BlBorder paint: Color black width: 1)
]

{ #category : #accessing }
BrUmlClassElement >> label: aBrText [
	self text: aBrText in: #label
]

{ #category : #'instance creation' }
BrUmlClassElement >> newContainers: aCollectionOfSymbols [

	aCollectionOfSymbols withIndexDo: [ :aSymbol :anIndex | 
		| aContainer anEditor aSeparator |
		aContainer := BlElement new.
		aContainer layout: BlLinearLayout horizontal.
		aContainer constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
		aContainer padding: (BlInsets all: 5).
	
		anEditor := BrEditorElement new.
		anEditor constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical fitContent ].
		anEditor editor: (BrTextEditor new).
		aContainer addChild: anEditor as: #editor.

		aSeparator := BlElement new.
		aSeparator constraintsDo: [ :c | 
			c vertical exact: 1.
			c horizontal matchParent ].
		aSeparator background: Color black.

		anIndex > 1
			ifTrue: [ self addChild: aSeparator ].

		self addChild: aContainer as: aSymbol ]
]

{ #category : #accessing }
BrUmlClassElement >> text: aBrText in: aContainerSymbol [
	"Change a text within a container given by its name"
	
	self
		editorIn: aContainerSymbol
		do: [ :anEditorElement | anEditorElement editor text: aBrText asRopedText ]
]
