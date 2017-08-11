instance creation
createElement: aTextEditor
	^ self newElement
		text: self text;
		editListener: aTextEditor textEditListener;
		yourself