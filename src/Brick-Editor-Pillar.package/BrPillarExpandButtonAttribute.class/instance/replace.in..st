accessing
replace: aBrText in: aBrEditor
	^ BlElement new
		size: 8@8;
		margin: (BlInsets top: 2 right: 5 bottom: 0 left: 5);
		background: Color gray;
		geometry: (BlPolygon vertices: (self expanded ifTrue: [ { 0@0 . 8@0. 4@8 } ] ifFalse: [ { 0@0 . 8@4. 0@8 } ]));
		addEventHandlerOn: BlClickEvent do: [ :anEvent | self action cull: aBrText cull: aBrEditor cull: self cull: anEvent currentTarget ];
		yourself