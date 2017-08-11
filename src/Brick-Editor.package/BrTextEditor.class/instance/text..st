accessing
text: aBrText

	text := aBrText.
	
	"Replacing text instance means that we can not guarantee structural integrity
	of existing cache and have to rebuild it invalidating the whole underlying model structure"
	segmentCollector := self defaultSegmentCollector.
	segmentCollector editor: self.
	segmentCollector text: text.
	
	text size > 1000
		ifTrue: [ self styler styleInBackgroundProcessNow: self text copy ]
		ifFalse: [ self styler style: self text copy ].

	"notify UI about structural update"
	self notifyChanged