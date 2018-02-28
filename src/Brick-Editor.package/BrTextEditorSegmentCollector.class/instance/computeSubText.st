private - computing
computeSubText
	"Recompute subtext according to currently cached segments"
	
	self
		assert: [ self hasCached ]
		description: [ 'There must be cached segments in order to compute sub text' ].
	
	subText := text
		from: (segments first textStart max: text size sign)
		to: segments last textEnd