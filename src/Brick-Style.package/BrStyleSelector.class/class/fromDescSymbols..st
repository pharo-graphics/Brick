instance creation
fromDescSymbols: aSymbolList
	| selectors relationships |
	selectors := OrderedCollection new.
	relationships := OrderedCollection new.
	aSymbolList
		do:
			[ :aSymb |  aSymb = #>
				ifTrue: [ relationships add: BrStyleRelation CHILD ]
				ifFalse: [ 
					(aSymb = aSymbolList first) not
						ifTrue: [ relationships add: BrStyleRelation DESCENDANT ].
					selectors add: (self fromSymbol: aSymb) ] ].
			
	^ (BrStyleCompoundSelector selectors: selectors relationships: relationships)
		update;
		yourself