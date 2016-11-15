as yet unclassified
createBlinkAnimation
	blinkAnimation := BlAnimation new
		duration: 500;
		beInfinite;
		onFinishedDo: [ self toggleVisiblity]