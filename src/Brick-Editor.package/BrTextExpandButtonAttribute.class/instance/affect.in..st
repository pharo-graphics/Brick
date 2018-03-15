accessing
affect: aBrText in: anEditorElement
	| aTextEditor |

	aTextEditor := anEditorElement editor.

	^ BlElement new
		size: 8@11;
		margin: (BlInsets top: 2 right: 5 bottom: 0 left: 5);
		background: (Color gray alpha: 0.4);
		geometry: (BlPolygon vertices: (isExpanded 	
			ifTrue: [ { 0@3 . 8@3. 4@11 } ] 
			ifFalse: [ { 0@3 . 8@7. 0@11 } ]));
		addEventHandlerOn: BlClickEvent do: [ :anEvent | 
			isExpanded
				ifTrue: [ 
					aBrText clearAttributes: [ :aTextAttribute | createdAttributes includes: aTextAttribute ] ]
				ifFalse: [ 
					createdAttributes := (attributesCreatingBlock cull: aBrText cull: aTextEditor) asOrderedCollection.
					aBrText attributes: createdAttributes ].
			self isExpanded: isExpanded not.
			aTextEditor invalidate: aBrText start to: aBrText end.
			aTextEditor update: aBrText start to: aBrText end ];
		yourself