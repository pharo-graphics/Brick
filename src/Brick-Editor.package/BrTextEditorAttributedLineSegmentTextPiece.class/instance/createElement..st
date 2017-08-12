instance creation
createElement: aTextEditor
	^ self newElement
		text: self text;
		padding: (BlInsets bottom: 5);
		editListener: aTextEditor textEditListener;
		yourself