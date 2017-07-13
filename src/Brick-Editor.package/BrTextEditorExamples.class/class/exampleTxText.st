examples - comparison
exampleTxText
	| text editorMorph wrapper |

	text := TxModel new.
	text endPosition insert: self loremIpsum.
	
	editorMorph := TxTextEditorMorph new initializeText: text.
	editorMorph
		hResizing: #spaceFill;
		vResizing: #spaceFill;
		layoutFrame: LayoutFrame identity;
		wrapText: true;
		scrollIntoView: text startPosition.
		
	wrapper := AthensWrapMorph new.
	wrapper
		layoutPolicy: ProportionalLayout new;
		addMorph: editorMorph.
	
	^ wrapper
		extent: self extent;
		openInWindow