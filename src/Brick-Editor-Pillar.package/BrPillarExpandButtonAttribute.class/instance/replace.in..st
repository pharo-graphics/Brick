accessing
replace: aBrText in: aBrEditor
	^ BlElement new
		size: 16@16;
		margin: (BlInsets top: 0 right: 5 bottom: 0 left: 5);
		background: Color veryDarkGray;
		geometry: (BlPolygon vertices: (self expanded ifTrue: [ { 0@0 . 16@0. 8@16 } ] ifFalse: [ { 0@0 . 16@8. 0@16 } ]));
		addEventHandlerOn: BlClickEvent do: [ :anEvent | self action cull: aBrText cull: aBrEditor cull: self cull: anEvent currentTarget ];
		yourself