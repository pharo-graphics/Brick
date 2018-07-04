examples - deletion
delete_Cr_in_HACrCrBA_at_3_3
	<gtExample>
	| aTextEditor aRemovedListener aRemovedEvent |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.
	
	aRemovedListener := BlEventHandler on: BlInfiniteDataSourceItemRangeRemoved do: [ :anEvent | aRemovedEvent := anEvent ].
	aTextEditor addEventHandler: aRemovedListener.
	
	aTextEditor delete: 3 to: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 5).

	self assert: aRemovedEvent itemCount equals: 1.
	self assert: aRemovedEvent position equals: 2.
	
	aTextEditor removeEventHandler: aRemovedListener.

	^ aTextEditor