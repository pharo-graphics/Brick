instance creation
createElement: anEditorElement
	| aTextEditor |

	aTextEditor := anEditorElement editor.

	^ self newElement
		in: [ :anElement | BrTextEditor isDebug ifTrue: [
				anElement background: (Color random alpha: 0.2).
				anElement rotateByDegrees: 15 ] ];
		text: self text;
		padding: (BlInsets top: 3 right: 0 bottom: 3 left: 0);
		editListener: aTextEditor textEditListener;
		addEventHandler: BrTextEditorAttributedLineSegmentTextListener new;
		yourself