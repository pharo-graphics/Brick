accessing
affect: aBrText in: aBrEditor
	^ BlElement new
		size: 8@8;
		margin: (BlInsets top: 2 right: 5 bottom: 0 left: 5);
		background: Color gray;
		geometry: (BlPolygon vertices: (isExpanded 	
			ifTrue: [ { 0@0 . 8@0. 4@8 } ] 
			ifFalse: [ { 0@0 . 8@4. 0@8 } ]));
		addEventHandlerOn: BlClickEvent do: [ :anEvent | 
			isExpanded
				ifTrue: [ 
					aBrText clearAttributes: [ :aTextAttribute | createdAttributes includes: aTextAttribute ] ]
				ifFalse: [ 
					createdAttributes := (attributesCreatingBlock cull: aBrText cull: aBrEditor) asOrderedCollection.
					aBrText attributes: createdAttributes ].
			self isExpanded: isExpanded not.
			aBrEditor invalidate: aBrText start to: aBrText end.
			aBrEditor update: aBrText start to: aBrText end.
		];
		yourself