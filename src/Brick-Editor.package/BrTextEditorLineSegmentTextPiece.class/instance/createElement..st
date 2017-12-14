instance creation
createElement: anEditorElement
	| aTextEditor |

	aTextEditor := anEditorElement editor.

	^ self newElement
		text: self text;
		padding: (BlInsets top: 3 right: 0 bottom: 3 left: 0);
		editListener: aTextEditor textEditListener;
		addEventHandler: BrTextEditorAttributedLineSegmentTextListener new;
		yourself