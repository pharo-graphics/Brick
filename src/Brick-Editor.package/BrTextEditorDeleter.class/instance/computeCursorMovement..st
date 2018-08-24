private
computeCursorMovement: aCursor
	"Cumpute by how much a given cursor should be moved after text deletion within current deletion intervals"

	^ self computeIndexMovement: aCursor position