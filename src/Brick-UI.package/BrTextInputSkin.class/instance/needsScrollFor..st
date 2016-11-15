scrolling
needsScrollFor: aCaretPosition
	| caretPosInParent |
	caretPosInParent := textContainer localPointToParent: aCaretPosition x @ aCaretPosition y.
	^ (self needsScrollXInParent: caretPosInParent) or: [ self needsScrollYInParent: caretPosInParent ]