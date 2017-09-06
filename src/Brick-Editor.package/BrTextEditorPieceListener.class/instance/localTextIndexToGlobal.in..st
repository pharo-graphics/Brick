text - computing
localTextIndexToGlobal: aTextIndex in: aTextEditElement
	"Transform a text index from local system of text edit element to global editor system"
	<return: #Number>
	
	^ (aTextEditElement text start + aTextIndex - aTextEditElement text isEmpty not asBit) max: 0