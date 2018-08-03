api - accessing
deselectedDo: aBlock
	"Evaluate a given block with a newly selected interval as an argument if there is one"

	deselectedInterval ifNotNil: aBlock