Extension { #name : #BrTextEditorLineSegment }

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditorLineSegment >> gtInfoFor: aView [
	<gtView>

	^ ({
		#index -> index.
		#text -> self text.
		#textStart -> self textStart.
		#textEnd -> self textEnd.
		#textEndDelimited -> self textEndDelimited.
		#lineSpacing -> self lineSpacing.
		#wordPadding -> self wordPadding.
		#paragraphMargin -> self paragraphMargin.
	 } asOrderedDictionary gtItemsFor: aView)
			title: 'Info';
			priority: 2
]

{ #category : #'*Brick-Editor-Extensions' }
BrTextEditorLineSegment >> gtPiecesFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Pieces';
		items: [ self pieces ];
		priority: 5;
		column: 'Interval' item: [ :each | (each textStart to: each textEnd) asString ];
		column: 'Text' item: [ :each | each ]
]
