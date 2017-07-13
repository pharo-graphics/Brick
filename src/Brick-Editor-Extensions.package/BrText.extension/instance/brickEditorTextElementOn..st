*Brick-Editor-Extensions
brickEditorTextElementOn: aBuilder
	<brickEditorElementOrder: 10>

	aBuilder text
		"styled: [ :anElement :aDisplayedValue :anEditor :aSegment :anEditorBuilder |
			
			anElement addEventHandlerOn: BrTextInsertedEvent do: [ :anEvent |
				
				anEditorBuilder styler
					ifNotNil: [ :aStyler | aStyler style: aDisplayedValue text ].
					
				anEditorBuilder editor
					insertedAt: anEvent start
					itemCount: anEvent length.

				anEditor iterator rebuildSegments: aDisplayedValue text of: anEditorBuilder.
				anEditor notifyChanged ]
			
			]"