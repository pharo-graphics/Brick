accessing
segment: aSubText pieces: aCollectionOfSubText
	<gtExample>
	<dependsOn: #subText:>
	<dependsOn: #pieces:>
	
	^ BrTextEditorSegment new
		segment: aSubText;
		in: [ :aTextEditorSegment |
			aCollectionOfSubText do: [ :aTextPiece | aTextEditorSegment addPiece: aTextPiece ] ];
		yourself