as yet unclassified
gtInspectorCSVIn: composite
	<gtInspectorPresentationOrder: 30>
	
	composite table
		display: [ messages ];
		column: [ 'Sender' ]
			evaluated: #sender
			width: 120;
		column: [ 'Message' ]
			evaluated: #text
			width: 120;
		column: [ 'Date' ]
			evaluated: #date