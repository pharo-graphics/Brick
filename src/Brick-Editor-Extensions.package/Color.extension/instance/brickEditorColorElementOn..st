*Brick-Editor-Extensions
brickEditorColorElementOn: aBuilder
	<brickEditorElementOrder: 10>
	
	aBuilder dynamic
		element: [ BlElement new ];
		bind: [ :anElement :aColor | anElement background: aColor ];
		styled: [ :anElement | anElement size: 50@50 ]