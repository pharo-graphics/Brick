accessing
start: aNumber 
	self 
		deprecated: 'Use start:end: instead'
		on: 	'11 August 2017' 
		in: 'Pharo-7.0-0-SNAPSHOT'.
	^ self start: aNumber end: self textEnd 