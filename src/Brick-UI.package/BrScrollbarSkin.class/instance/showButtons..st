as yet unclassified
showButtons: aBoolean
	aBoolean
		ifTrue:
			[ widget children size = 3
				ifTrue: [ ^ self ].
			widget
				addChildFirst: decrementButton ;
				addChild: incrementButton ]
		ifFalse:
			[ widget children size > 3
				ifTrue: [ ^ self ].
			widget
				removeChild: decrementButton;
				removeChild: incrementButton ]