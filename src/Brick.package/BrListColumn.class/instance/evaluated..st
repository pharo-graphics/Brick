api - accessing
evaluated: aBlockClosure
	"Specify how a column value should be computed out of a row value within a list.
	Columned lits additionally provides two optional parameters: row index for which the value is computed
	and a column index. They can be used to display addtional information within a list such as row index.

	Expected block closure definition is the following: [ :aRowValue :aRowIndex :aColumnIndex | ]"

	self
		assert: [ aBlockClosure isNotNil ]
		description: [ 'Evaluation block must not be nil' ].

	evaluationBlock := aBlockClosure