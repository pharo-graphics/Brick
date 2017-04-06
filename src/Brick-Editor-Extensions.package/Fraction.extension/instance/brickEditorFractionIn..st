*Brick-Editor-Extensions
brickEditorFractionIn: aBuilder
	<brickEditorOrder: 50>
	
	aBuilder text
		display: [ :aFraction | BrRopedText string: aFraction numerator asString ].

	aBuilder element
		display: [ BlElement new
			background: Color darkGray;
			size: 85@2;
			margin: (BlInsets top: 1 right: 0 bottom: 3 left: 0) ].
	
	aBuilder text
		display: [ :aFraction | BrRopedText string: aFraction denominator asString ].