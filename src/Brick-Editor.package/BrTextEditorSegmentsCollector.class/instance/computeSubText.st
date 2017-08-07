private - computing
computeSubText
	"Recompute subtext according to currently cached segments"
	
	self
		assert: [ self hasCached ]
		description: [ 'There must be cached segments in order to ciompute sub text' ].
	
	subText := text
		from: segments first segment start
		to: segments last segment end