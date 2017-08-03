text - selection
mergeSelection: aFromIndex to: aToIndex
	| newFrom newTo |

	newFrom := self hasSelection
		ifTrue: [ self selection from min: aFromIndex ]
		ifFalse: [ aFromIndex ].
		
	newTo := self hasSelection
		ifTrue: [ self selection to max: aToIndex ]
		ifFalse: [ aToIndex ].
	
	self
		select: newFrom
		to: newTo