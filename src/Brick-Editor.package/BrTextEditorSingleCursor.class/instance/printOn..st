printing
printOn: aStream
	aStream
		nextPutAll: 'Cursor (';
		nextPutAll: self position asString;
		nextPutAll: ')'