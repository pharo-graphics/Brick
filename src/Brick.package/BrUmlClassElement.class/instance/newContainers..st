instance creation
newContainers: aCollectionOfSymbols

	aCollectionOfSymbols withIndexDo: [ :aSymbol :anIndex | 
		| aContainer anEditor aSeparator |
		aContainer := BlElement new.
		aContainer layout: BlLinearLayout horizontal.
		aContainer constraintsDo: [ :c | 
			c vertical fitContent.
			c horizontal matchParent ].
		aContainer padding: (BlInsets all: 5).
		aContainer graph beChildrenContainer: aSymbol.
	
		anEditor := BrEditorElement new.
		anEditor beDiagrammerSelectionLeaf.
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