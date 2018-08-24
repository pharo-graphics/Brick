"
I contain examples-tests of the editor backed up by line based segments
"
Class {
	#name : #BrTextEditorLineSegmentExamples,
	#superclass : #Object,
	#category : 'Brick-Editor-Examples'
}

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_ACrCr_in_HACrCrBA_at_2_4 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 1 to: 4.

	self assert: aTextEditor text asString equals: 'HBA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 3).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_A_in_A_at_1_1 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_A_inEmptyAt_0.

	aTextEditor delete: 0 to: 1.

	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_A_in_BA_at_2_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor delete: 1 to: 2.

	self assert: aTextEditor text asString equals: 'B'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_A_in_BCrA_at_3_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_BA_At_1.

	aTextEditor delete: 2 to: 3.

	self assert: aTextEditor text asString equals: 'B', String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 2).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_BA_in_BA_at_1_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.

	aTextEditor delete: 0 to: 2.

	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_B_in_BA_at_1_1 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor delete: 0 to: 1.

	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrB_in_HACrCrBA_at_4_5 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 3 to: 5.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 4).
	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCr_in_HACrCrBA_at_3_4 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 2 to: 4.

	self assert: aTextEditor text asString equals: 'HABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 4).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_Cr_in_BACr_at_3_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_BA_At_2.

	aTextEditor delete: 2 to: 3.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_Cr_in_BCrA_at_2_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_BA_At_1.

	aTextEditor delete: 1 to: 2.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_Cr_in_Cr_at_1_1 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_inEmptyAt_0.
	
	aTextEditor delete: 0 to: 1.

	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_Cr_in_HACrCrBA_at_3_3 [
	<gtExample>
	| aTextEditor aRemovedListener aRemovedEvent |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.
	
	aRemovedListener := BlEventHandler on: BlInfiniteDataSourceItemRangeRemoved do: [ :anEvent | aRemovedEvent := anEvent ].
	aTextEditor addEventHandler: aRemovedListener.
	
	aTextEditor delete: 2 to: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 5).

	self assert: aRemovedEvent itemCount equals: 1.
	self assert: aRemovedEvent position equals: 2.
	
	aTextEditor removeEventHandler: aRemovedListener.

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_Cr_in_HACrCrBA_at_4_4 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 3 to: 4.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 5).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_HACrCrBA_in_HACrCrBA_at_1_6 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 0 to: 6.

	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_HACrCrB_in_HACrCrBA_at_1_5 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 0 to: 5.

	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_HACrCr_in_HACrCrBA_at_1_4 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 0 to: 4.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).

	^ aTextEditor
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentExamples >> emptyEditor [
	<gtExample>
	| aTextEditor |
	
	aTextEditor := BrTextEditor new segmentBuilder: self lineSegmentBuilder.
	
	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_A_inEmptyAt_0 [
	<gtExample>
	| aTextEditor |
	
	aTextEditor := self emptyEditor.
	
	aTextEditor insertString: 'A' at: 0.
	
	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'A'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_A_in_HACrBA_At_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HABA_At_2.

	aTextEditor insertString: 'A' at: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'ABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 6).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'ABA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_A_in_HACrCrBA_At_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_3.

	aTextEditor insertString: 'A' at: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'A', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 4).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'A'.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_B_in_A_at_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_A_inEmptyAt_0.
	
	aTextEditor insertString: 'B' at: 0.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_C_in_CrBA_At_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_BA_At_0.

	aTextEditor insertString: 'C' at: 0.

	self assert: aTextEditor text asString equals: 'C', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'C'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_D_in_CCrBA_At_1 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_C_in_CrBA_At_0.

	aTextEditor insertString: 'D' at: 1.

	self assert: aTextEditor text asString equals: 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'CD'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_HABA_inEmptyAt_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self emptyEditor.
	
	aTextEditor insertString: 'HABA' at: 0.
	
	self assert: aTextEditor text asString equals: 'HABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 4).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_Hello_inEmptyAt_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self emptyEditor.

	aTextEditor insertString: 'Hello' at: 0.

	self assert: aTextEditor text asString equals: 'Hello'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 5).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLineCrLf_in_HACrBA_At_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HABA_At_2.

	aTextEditor insertString: String cr, String lf at: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, String cr, String lf, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_inCrAt_1 [
	<gtExample>
	| aTextEditor anInsertedListener anInsertedEvent |
	aTextEditor := self insert_NewLine_inEmptyAt_0.

	anInsertedListener := BlEventHandler on: BlInfiniteDataSourceItemRangeInserted do: [ :anEvent | anInsertedEvent := anEvent ].
	aTextEditor addEventHandler: anInsertedListener.

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: String cr, String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 2).
	
	self assert: anInsertedEvent itemCount equals: 1.
	self assert: anInsertedEvent position equals: 3.
	
	aTextEditor removeEventHandler: anInsertedListener.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_inEmptyAt_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self emptyEditor.
	
	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_BA_At_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments first text asString equals: ''.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_BA_At_1 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: 'B', String cr, 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'B'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'A'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_BA_At_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_B_in_A_at_0.
	
	aTextEditor insertString: String cr at: 2.

	self assert: aTextEditor text asString equals: 'BA', String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_CDCrBA_At_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_D_in_CCrBA_At_1.

	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr, 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments first text asString equals: ''.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'CD'.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 6).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_CrCDCrBA_At_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CDCrBA_At_0.

	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr, String cr, 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments first text asString equals: ''.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'CD'.
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments fourth text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_CrCDCrBA_At_1 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CDCrBA_At_0.

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: String cr, String cr, 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments first text asString equals: ''.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'CD'.
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments fourth text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HABA_At_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor text asString equals: String cr, 'HABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments first text asString equals: ''.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'HABA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HABA_At_1 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 1.

	self assert: aTextEditor text asString equals: 'H', String cr, 'ABA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'H'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'ABA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HABA_At_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 2.

	self assert: aTextEditor text asString equals: 'HA', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HABA_At_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 3.

	self assert: aTextEditor text asString equals: 'HAB', String cr, 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 3).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HAB'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (4 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'A'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HABA_At_4 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.

	aTextEditor insertString: String cr at: 4.

	self assert: aTextEditor text asString equals: 'HABA', String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 4).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HABA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (5 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HACrBA_At_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HABA_At_2.

	aTextEditor insertString: String cr at: 2.

	self assert: aTextEditor text asString equals: 'HA', String cr, String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 6).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HACrBA_At_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HABA_At_2.

	aTextEditor insertString: String cr at: 3.

	self assert: aTextEditor text asString equals: 'HA', String cr, String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 6).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HeCrllo_At_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_Hello_At_2.

	aTextEditor insertString: String cr at: 3.

	self assert: aTextEditor text asString equals: 'He', String cr, String cr, 'llo'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'He'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 7).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'llo'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_Hello_At_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_Hello_inEmptyAt_0.

	aTextEditor insertString: String cr at: 2.

	self assert: aTextEditor text asString equals: 'He', String cr, 'llo'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'He'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 6).
	self assert: aTextEditor segmentCollector segments second text asString equals: 'llo'.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_haCrCrbaCr_inHelloAt_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_Hello_inEmptyAt_0.

	aTextEditor insertString: ('ha', String cr, String cr, 'ba', String cr) at: 2.

	self assert: aTextEditor text asString equals: 'He','ha', String cr, String cr, 'ba', String cr,'llo'.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 4).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'Heha'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (5 to: 5).
	self assert: aTextEditor segmentCollector segments second text asString equals: String cr.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (6 to: 8).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'ba'.
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (9 to: 12).
	self assert: aTextEditor segmentCollector segments fourth text asString equals: 'llo'.

	^ aTextEditor
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentExamples >> lineSegmentBuilder [
	<gtExample>
	
	^ BrTextEditorLineSegmentBuilder new
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentExamples >> segmentStream [
	<gtExample>
	
	^ BrEditorSegmentStream new limit: Float infinity
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_Empty_at_0 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self emptyEditor.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 0
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_Empty_at_1 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self emptyEditor.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 0
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_Empty_at_2 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self emptyEditor.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 0
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_Empty_at_3 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self emptyEditor.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 0
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_0 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 0
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_1 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 1
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_2 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 2
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 1.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_3 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 3
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 2.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_4 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 4
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 2.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_5 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 5
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 3.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_6 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 6
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 3.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_7 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 7
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 3.

	^ aTextEditor
]

{ #category : #'examples - segments' }
BrTextEditorLineSegmentExamples >> segment_in_HACrCrLfBA_at_8 [
	<gtExample>
	| aTextEditor aSegment |
	
	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	
	aTextEditor segmentCollector
		cachedSegmentAt: 8
		ifFound: [ :aFoundSegment | aSegment := aFoundSegment ]
		ifNotFound: [].

	self assert: aSegment index equals: 3.

	^ aTextEditor
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_1234506789 [
	<gtExample>

	^ BlSubText text: (BlRopedText string: '1234506789')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_A [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'A')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_ACr [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'A', String cr)
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_ACrB [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'A', String cr, 'B')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_ACrBCrC [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'A', String cr, 'B', String cr, 'C')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_ACrCr [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'A', String cr, String cr)
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_ACrCrB [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'A', String cr, String cr, 'B')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_BA [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'BA')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_BCA [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'BCA')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_Cr [
	<gtExample>

	^ BlSubText text: (BlRopedText string: String cr)
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_CrA [
	<gtExample>

	^ BlSubText text: (BlRopedText string: String cr, 'A')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_HABA [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'HABA')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_Hello [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'Hello')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_empty [
	<gtExample>

	^ BlRopedText string: ''
]
