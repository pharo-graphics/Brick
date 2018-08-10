api - instantiation
buildDefault
	^ BlTextEditElement new
		text: self text;
		clipChildren: false;
		padding: (BlInsets top: 3 right: 0 bottom: 3 left: 0);
		addEventHandler: BrTextEditorAttributedLineSegmentTextListener new;

		"editor requests to show a cursor as a result of its position change"
		when: BrTextEditorShowCursorRequest do: [ :aRequest |
			aRequest hasFocus
				ifTrue: [
					aRequest currentTarget showCursorAt: aRequest cursorPosition.
					aRequest editorElement dispatchEvent: (BrTextEditorCursorElementAddedEvent new cursorElement: aRequest currentTarget cursorElement) ] ];

		"editor requests to hide a cursor as a result of its position change"
		when: BrTextEditorHideCursorRequest do: [ :aRequest |
			aRequest currentTarget hasCursor ifTrue: [
				| aCursorElement |
				aCursorElement := aRequest currentTarget cursorElement.
				aRequest currentTarget hideCursor.
				aRequest editorElement dispatchEvent: (BrTextEditorCursorElementRemovedEvent new cursorElement: aCursorElement) ] ];
		"when clicking inside of a text piece we should move cursor there and request editor focus"
		when: BlMouseDownEvent do: [ :anEvent |
			| aLocalTextIndex |
			aLocalTextIndex := anEvent currentTarget paragraph indexAtPosition: anEvent localPosition.
			self editorElement requestFocus.
			self editorElement editor
					moveCursorTo: ((anEvent currentTarget text start + aLocalTextIndex - 1) max: 0) ];
		
		"text piece got inside of selected area"
		when: BlElementSelectionAcquiredEvent do: [ :anEvent |
			| aTextEditElement |
			anEvent consumed: true.

			aTextEditElement := anEvent currentTarget.
			
			"selection bounds equal to our bounds => fast select the whole text piece"
			(anEvent bounds = aTextEditElement boundsInLocal)
				ifTrue: [
					| aGlobalFrom aGlobalTo |
					
					aGlobalFrom := aTextEditElement text start - 1.
					aGlobalTo := aTextEditElement text start + aTextEditElement text size - 1.
					
					self editorElement editor recordSelection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ]
				ifFalse: [ 
					| aFromIndex aToIndex aGlobalFrom aGlobalTo |
					aFromIndex := aTextEditElement paragraph indexAtPosition: anEvent bounds origin.
					aToIndex := aTextEditElement paragraph indexAtPosition: anEvent bounds corner.

					"remove previous selection"	
					aTextEditElement selection do: [ :aMonotoneSelection |
						aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
						aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
						
						self editorElement editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ].
					
					aGlobalFrom := aTextEditElement text start + aFromIndex - 1.
					aGlobalTo := aTextEditElement text start + aToIndex - 1.
					
					self editorElement editor recordSelection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ] ];

		"text piece got outside of then selected area"
		when: BlElementSelectionLostEvent do: [ :anEvent |
			| aTextEditElement |
			anEvent consumed: true.

			aTextEditElement := anEvent currentTarget.
	
			aTextEditElement selection do: [ :aMonotoneSelection |
				| aGlobalFrom aGlobalTo |

				aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
				aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
				self editorElement editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ] ];

		"selection changed in the editor, select a given interval"
		when: BrTextEditorSelectRequest do: [ :anEvent | anEvent currentTarget select: anEvent fromIndex to: anEvent toIndex ];

		"selection changed in the editor, deselect a given interval"
		when: BrTextEditorDeselectRequest do: [ :anEvent | anEvent currentTarget selectNone ];

		yourself