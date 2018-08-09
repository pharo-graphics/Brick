api - items
itemModelAt: anIndex
	<return: #BrToolbarItemModel>
	self
		assert: [ anIndex isInteger ] 
		description: [ 'Index must be an integer' ].
	self
		assert: [ anIndex > 0 ] 
		description: [ 'Index must be a positive integer' ].
	self
		assert: [ anIndex <= self numberOfItems ] 
		description: [ 'Index must be less of equal to number of existing items' ].
	^ self items at: anIndex