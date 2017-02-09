initialization
subject: aSubject
	| aLineIterator |
	subject := aSubject.
	
	self flag: #TODO.
	segments := OrderedCollection new.
	aLineIterator := aSubject rope iterator.
	[ aLineIterator hasNext ] whileTrue: [ 
		segments add: (BrTextEditorSegment new rope: aLineIterator nextLine) ].
	interval := 1 to: aSubject rope size