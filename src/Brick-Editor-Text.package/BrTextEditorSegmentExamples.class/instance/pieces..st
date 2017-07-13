accessing
pieces: aSubText
	<gtExample>
	<dependsOn: #subText:>

	^ Array streamContents: [ :aStream | 
		| iterator |
		iterator := aSubText iterator.
		[ iterator hasNext ] whileTrue: [ 
			aStream nextPut: iterator nextWord ] ]