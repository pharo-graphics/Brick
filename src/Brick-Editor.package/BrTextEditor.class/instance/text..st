accessing
text: aBrText

	text := aBrText.
	
	"Replacing text instance means that we can not guarantee structural integrity
	of existing cache and have to rebuild it invalidating the whole underlying model structure"
	segmentsCollector := self defaultSegmentsCollector.
	segmentsCollector text: text.

	"notify UI about structural update"
	self notifyChanged