api - accessing
selectedDo: aBlock
	"Evaluate a given block with a newly selected interval as an argument if there is one"

	selectedInterval ifNotNil: aBlock