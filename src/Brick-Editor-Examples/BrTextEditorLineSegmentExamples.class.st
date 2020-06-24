"
I contain examples-tests of the editor backed up by line based segments
"
Class {
	#name : #BrTextEditorLineSegmentExamples,
	#superclass : #Object,
	#category : #'Brick-Editor-Examples'
}

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_0 [
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 0.
	
	"cursor is in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment).
	
	"cursor is not in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.
		
	"cursor is not in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	^ aTextEditor
]

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_1 [
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 1.
	
	"cursor is in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment).
	
	"cursor is not in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.
		
	"cursor is not in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	^ aTextEditor
]

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_2 [
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 2.
	
	"cursor is in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment).
	
	"cursor is not in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.
	
	"cursor is not in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	^ aTextEditor
]

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_3 [
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 3.

	"cursor is not in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment).

	"cursor is not in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	^ aTextEditor
]

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_4 [
	"In this example cursor is nowhere to be found in UI(in fact it is between Cr and Lf)"
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 4.

	"cursor is not in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is not in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is not in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment).

	^ aTextEditor
]

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_5 [
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 5.

	"cursor is not in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is not in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment).

	^ aTextEditor
]

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_6 [
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 6.

	"cursor is not in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is not in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment).

	^ aTextEditor
]

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_7 [
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 7.

	"cursor is not in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is not in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	^ aTextEditor
]

{ #category : #'examples - cursor' }
BrTextEditorLineSegmentExamples >> cursor_in_HACrCrLfBA_at_8 [
	<gtExample>
	| aTextEditor aSegment aCursor |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	aCursor := BrTextEditorSingleCursor new position: 8.

	"cursor is not in the first segment"
	aSegment := aTextEditor segmentCollector segments first.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is not in the second segment"
	aSegment := aTextEditor segmentCollector segments second.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	"cursor is not in the third segment"
	aSegment := aTextEditor segmentCollector segments third.
	self assert: (aCursor
		insideSubText: aSegment pieces first
		of: aSegment) not.

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_ACrCr_in_HACrCrBA_at_2_4 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HACrBA_At_2.

	aTextEditor delete: 1 to: 4.

	self assert: aTextEditor text asString equals: 'HBA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 3).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_B_in_BA_at_1_1 [
	<gtExample>
	| aTextEditor theOldPieces theNewPieces |
	aTextEditor := self insert_B_in_A_at_0.
	
	theOldPieces := aTextEditor segmentCollector segments first pieces.

	aTextEditor delete: 0 to: 1.

	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).
	
	theNewPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theOldPieces equals: theNewPieces.

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).
	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_0_1 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 0 to: 1.

	self assert: aTextEditor text asString equals: String cr, 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 3).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 6).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_0_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 0 to: 2.

	self assert: aTextEditor text asString equals: 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 5).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_0_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 0 to: 3.

	self assert: aTextEditor text asString equals: 'D', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_0_4 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 0 to: 4.

	self assert: aTextEditor text asString equals: String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 3).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_0_5 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 0 to: 5.

	self assert: aTextEditor text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_0_6 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 0 to: 6.

	self assert: aTextEditor text asString equals: 'A'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 1).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_0_7 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 0 to: 7.

	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_1_7 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 1 to: 7.

	self assert: aTextEditor text asString equals: String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_2_7 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 2 to: 7.

	self assert: aTextEditor text asString equals: String cr, String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 2).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_3_7 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 3 to: 7.

	self assert: aTextEditor text asString equals: String cr, String cr, 'C'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 3).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_4_7 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 4 to: 7.

	self assert: aTextEditor text asString equals: String cr, String cr, 'CD'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_5_7 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 5 to: 7.

	self assert: aTextEditor text asString equals: String cr, String cr, 'CD', String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (5 to: 5).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 4).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_6_7 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 6 to: 7.

	self assert: aTextEditor text asString equals: String cr, String cr, 'CD', String cr, 'B'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (5 to: 6).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 4).

	^ aTextEditor
]

{ #category : #'examples - deletion' }
BrTextEditorLineSegmentExamples >> delete_CrCrCDCrBA_in_CrCrCDCrBA_at_7_7 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_CrCDCrBA_At_0.

	aTextEditor delete: 7 to: 7.

	self assert: aTextEditor text asString equals: String cr, String cr, 'CD', String cr, 'BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	self assert: aTextEditor segmentCollector segments second textInterval equals: (1 to: 1).
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 4).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

	^ aTextEditor
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentExamples >> emptyEditor [
	<gtExample>
	| aTextEditor aTextEditorElement aSegmentElement aPieceElement |
	
	aTextEditor := BrTextEditor new segmentBuilder: self lineSegmentBuilder.
	
	self assert: aTextEditor text asString equals: ''.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 0).
	
	aTextEditorElement := BrEditorElement new.
	aTextEditorElement size: 600@600.
	aTextEditorElement editor: aTextEditor.
	aTextEditorElement forceLayout.
	
	self assert: aTextEditorElement childrenCount equals: 1.

	aSegmentElement := aTextEditorElement children first.
	self assert: aSegmentElement childrenCount equals: 1.
	
	aPieceElement := aSegmentElement children first.
	self assert: aPieceElement segmentPiece == aTextEditor segmentCollector segments first pieces first.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_000_in_HABA_at_2 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_HABA_inEmptyAt_0.
	
	aTextEditor insertString: '000' at: 2.

	self assert: aTextEditor text asString equals: 'HA000BA'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 7).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA000BA'.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_CrLf_in_Hello_At_5 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_Hello_inEmptyAt_0.

	aTextEditor insertString: String crlf at: 5.

	self assert: aTextEditor text asString equals: 'Hello', String crlf.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 5).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'Hello'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (6 to: 6).
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_E_in_Hello_World_at_2 [
	<gtExample>
	| aTextEditor thePiecesBeforeInsertion |
	aTextEditor := self insert_Hello_World_inEmptyAt_0.
	
	thePiecesBeforeInsertion := aTextEditor segmentCollector segments first pieces.
	self assert: thePiecesBeforeInsertion size equals: 3.
	
	self assert: thePiecesBeforeInsertion first textStart equals: 0.
	self assert: thePiecesBeforeInsertion first textEnd equals: 5.
	
	self assert: thePiecesBeforeInsertion second textStart equals: 5.
	self assert: thePiecesBeforeInsertion second textEnd equals: 6.

	self assert: thePiecesBeforeInsertion third textStart equals: 6.
	self assert: thePiecesBeforeInsertion third textEnd equals: 11.

	aTextEditor insertString: 'E' at: 2.
	
	self assert: thePiecesBeforeInsertion first textStart equals: 0.
	self assert: thePiecesBeforeInsertion first textEnd equals: 6.
	
	self assert: thePiecesBeforeInsertion second textStart equals: 6.
	self assert: thePiecesBeforeInsertion second textEnd equals: 7.

	self assert: thePiecesBeforeInsertion third textStart equals: 7.
	self assert: thePiecesBeforeInsertion third textEnd equals: 12.

	self assert: aTextEditor text asString equals: 'HeEllo World'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 12).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_Hello_World_inEmptyAt_0 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self emptyEditor.

	aTextEditor insertString: 'Hello World' at: 0.

	self assert: aTextEditor text asString equals: 'Hello World'.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 11).
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 1).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLineCrLf_in_HACrBA_At_3 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_NewLine_in_HABA_At_2.

	aTextEditor insertString: String cr, String lf at: 3.

	self assert: aTextEditor text asArray equals: { $H. $A.  Character cr. Character nel. $B. $A. }.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 2).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'HA'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (3 to: 3).
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 6).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).
	
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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

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
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'CD'.
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments fourth text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 4).

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
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (2 to: 4).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'CD'.
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (5 to: 7).
	self assert: aTextEditor segmentCollector segments fourth text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 4).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 6).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

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
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 6).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'BA'.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

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
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (4 to: 7).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'llo'.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 3).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HelloCrWorldCr_WithAppendingAfterWorld_at_5 [
	<gtExample>
	| aTextEditor aSegment thePieces |
	aTextEditor := self pieces_HelloCrWorldCr_WithAppendingAfterWorld.
	
	aTextEditor insertString: String cr at: 5.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 4.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	
	aSegment := aTextEditor segmentCollector segments second.
	self assert: aSegment index equals: 2.
	self assert: aSegment text asString equals: ''.
	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 6.
	
	aSegment := aTextEditor segmentCollector segments third.
	self assert: aSegment index equals: 3.
	self assert: aSegment text asString equals: 'World'.
	self assert: aSegment textStart equals: 7.
	self assert: aSegment textEnd equals: 12.
	
	aSegment := aTextEditor segmentCollector segments fourth.
	self assert: aSegment index equals: 4.
	self assert: aSegment text asString equals: ''.
	self assert: aSegment textStart equals: 13.
	self assert: aSegment textEnd equals: 13.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.
	
	thePieces := aTextEditor segmentCollector segments second pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 6.
	self assert: thePieces first textEnd equals: 6.
	
	thePieces := aTextEditor segmentCollector segments third pieces.
	self assert: thePieces size equals: 2.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 7.
	self assert: thePieces first textEnd equals: 12.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces second textStart equals: 7.
	self assert: thePieces second textEnd equals: 12.
	self assert: thePieces second adornmentAttribute shouldAppend.
	
	self assert: (thePieces first text ~~ thePieces second text).
	
	thePieces := aTextEditor segmentCollector segments fourth pieces.
	self assert: thePieces size equals: 1.

	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 13.
	self assert: thePieces first textEnd equals: 13.
	
	self assert: (thePieces first text ~~ aTextEditor segmentCollector segments fourth text).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HelloWorld_WithReplacementAndAppendingOfWorld_at_0 [
	<gtExample>
	| aTextEditor aSegment thePieces |
	aTextEditor := self pieces_Hello_World_WithReplacementAndAppendingOfWorld.
	
	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: ''.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	
	aSegment := aTextEditor segmentCollector segments second.
	self assert: aSegment index equals: 2.
	self assert: aSegment text asString equals: 'Hello'.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 6.
	
	aSegment := aTextEditor segmentCollector segments third.
	self assert: aSegment index equals: 3.
	self assert: aSegment text asString equals: 'World'.
	self assert: aSegment textStart equals: 7.
	self assert: aSegment textEnd equals: 12.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 0.
	
	thePieces := aTextEditor segmentCollector segments second pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 1.
	self assert: thePieces first textEnd equals: 6.
	
	thePieces := aTextEditor segmentCollector segments third pieces.
	self assert: thePieces size equals: 2.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces first textStart equals: 7.
	self assert: thePieces first textEnd equals: 12.
	self assert: thePieces first adornmentAttribute shouldReplace.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces second textStart equals: 7.
	self assert: thePieces second textEnd equals: 12.
	self assert: thePieces second adornmentAttribute shouldAppend.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HelloWorld_WithReplacementOfWorld_at_0 [
	<gtExample>
	| aTextEditor aSegment thePieces |
	aTextEditor := self pieces_Hello_World_WithReplacementOfWorld.
	
	aTextEditor insertString: String cr at: 0.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: ''.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 0.
	
	aSegment := aTextEditor segmentCollector segments second.
	self assert: aSegment index equals: 2.
	self assert: aSegment text asString equals: 'Hello'.
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 6.
	
	aSegment := aTextEditor segmentCollector segments third.
	self assert: aSegment index equals: 3.
	self assert: aSegment text asString equals: 'World'.
	self assert: aSegment textStart equals: 7.
	self assert: aSegment textEnd equals: 12.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 0.
	
	thePieces := aTextEditor segmentCollector segments second pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 1.
	self assert: thePieces first textEnd equals: 6.
	
	thePieces := aTextEditor segmentCollector segments third pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces first textStart equals: 7.
	self assert: thePieces first textEnd equals: 12.
	self assert: thePieces first adornmentAttribute shouldReplace.

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_HelloWorld_WithReplacementOfWorld_at_5 [
	<gtExample>
	| aTextEditor aSegment thePieces |
	aTextEditor := self pieces_Hello_World_WithReplacementOfWorld.
	
	aTextEditor insertString: String cr at: 5.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	
	aSegment := aTextEditor segmentCollector segments second.
	self assert: aSegment index equals: 2.
	self assert: aSegment text asString equals: ''.
	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 6.
	
	aSegment := aTextEditor segmentCollector segments third.
	self assert: aSegment index equals: 3.
	self assert: aSegment text asString equals: 'World'.
	self assert: aSegment textStart equals: 7.
	self assert: aSegment textEnd equals: 12.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.
	
	thePieces := aTextEditor segmentCollector segments second pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 6.
	self assert: thePieces first textEnd equals: 6.
	
	thePieces := aTextEditor segmentCollector segments third pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces first textStart equals: 7.
	self assert: thePieces first textEnd equals: 12.
	self assert: thePieces first adornmentAttribute shouldReplace.

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
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

	^ aTextEditor
]

{ #category : #'examples - insertion' }
BrTextEditorLineSegmentExamples >> insert_NewLine_in_Hello_At_5 [
	<gtExample>
	| aTextEditor |
	aTextEditor := self insert_Hello_inEmptyAt_0.

	aTextEditor insertString: String cr at: 5.

	self assert: aTextEditor text asString equals: 'Hello', String cr.
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	self assert: aTextEditor segmentCollector segments first textInterval equals: (0 to: 5).
	self assert: aTextEditor segmentCollector segments first text asString equals: 'Hello'.
	self assert: aTextEditor segmentCollector segments second textInterval equals: (6 to: 6).
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 2).

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
	self assert: aTextEditor segmentCollector segments second text asString equals: ''.
	self assert: aTextEditor segmentCollector segments third textInterval equals: (6 to: 8).
	self assert: aTextEditor segmentCollector segments third text asString equals: 'ba'.
	self assert: aTextEditor segmentCollector segments fourth textInterval equals: (9 to: 12).
	self assert: aTextEditor segmentCollector segments fourth text asString equals: 'llo'.
	self assert: aTextEditor segmentCollector cachedInterval equals: (1 to: 4).

	^ aTextEditor
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentExamples >> lineSegmentBuilder [
	<gtExample>
	
	^ BrTextEditorLineSegmentBuilder new
]

{ #category : #'examples - overwrite' }
BrTextEditorLineSegmentExamples >> overwrite_Hello_World_with_S_in_Hello_World [
	<gtExample>
	| aTextEditor aSegment theOldPieces theNewPieces |
	aTextEditor := self insert_Hello_World_inEmptyAt_0.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello World'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	
	theOldPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theOldPieces size equals: 3.
	
	self assert: (theOldPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces first textStart equals: 0.
	self assert: theOldPieces first textEnd equals: 5.
	
	self assert: (theOldPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces second textStart equals: 5.
	self assert: theOldPieces second textEnd equals: 6.
	
	self assert: (theOldPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces third textStart equals: 6.
	self assert: theOldPieces third textEnd equals: 11.
	
	aTextEditor selecter
		from: 0 to: 11;
		select.
	
	aTextEditor inserter
		atCursor;
		string: 'S';
		insert.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'S'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 1.
	
	theNewPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theNewPieces size equals: 1.
	
	self assert: (theNewPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theNewPieces first textStart equals: 0.
	self assert: theNewPieces first textEnd equals: 1.
	
	"the state of old pieces should be at the moment of deletion, right before insertion"
	self assert: (theOldPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces first textStart equals: 0.
	self assert: theOldPieces first textEnd equals: 0.
	
	self assert: (theOldPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces second textStart equals: 0.
	self assert: theOldPieces second textEnd equals: 0.
	
	self assert: (theOldPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces third textStart equals: 0.
	self assert: theOldPieces third textEnd equals: 0.
	
	^ aTextEditor
]

{ #category : #'examples - overwrite' }
BrTextEditorLineSegmentExamples >> overwrite_World_with_S_in_Hello_World [
	<gtExample>
	| aTextEditor aSegment theOldPieces theNewPieces |
	aTextEditor := self insert_Hello_World_inEmptyAt_0.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello World'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	
	theOldPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theOldPieces size equals: 3.
	
	self assert: (theOldPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces first textStart equals: 0.
	self assert: theOldPieces first textEnd equals: 5.
	
	self assert: (theOldPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces second textStart equals: 5.
	self assert: theOldPieces second textEnd equals: 6.
	
	self assert: (theOldPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces third textStart equals: 6.
	self assert: theOldPieces third textEnd equals: 11.
	
	aTextEditor selecter
		from: 6 to: 11;
		select.
	
	aTextEditor inserter
		atCursor;
		string: 'S';
		insert.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello S'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 7.
	
	theNewPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theNewPieces size equals: 3.
	
	self assert: (theNewPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theNewPieces first textStart equals: 0.
	self assert: theNewPieces first textEnd equals: 5.
	
	self assert: (theNewPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theNewPieces second textStart equals: 5.
	self assert: theNewPieces second textEnd equals: 6.
	
	self assert: (theNewPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theNewPieces third textStart equals: 6.
	self assert: theNewPieces third textEnd equals: 7.
	
	"the state of old pieces should be at the moment of deletion, right before insertion"
	self assert: (theOldPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces first textStart equals: 0.
	self assert: theOldPieces first textEnd equals: 5.
	
	self assert: (theOldPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces second textStart equals: 5.
	self assert: theOldPieces second textEnd equals: 6.
	
	self assert: (theOldPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces third textStart equals: 6.
	self assert: theOldPieces third textEnd equals: 6.
	
	^ aTextEditor
]

{ #category : #'examples - overwrite' }
BrTextEditorLineSegmentExamples >> overwrite_d_with_S_in_Hello_World [
	<gtExample>
	| aTextEditor aSegment theOldPieces theNewPieces |
	aTextEditor := self insert_Hello_World_inEmptyAt_0.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello World'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	
	theOldPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theOldPieces size equals: 3.
	
	self assert: (theOldPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces first textStart equals: 0.
	self assert: theOldPieces first textEnd equals: 5.
	
	self assert: (theOldPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces second textStart equals: 5.
	self assert: theOldPieces second textEnd equals: 6.
	
	self assert: (theOldPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces third textStart equals: 6.
	self assert: theOldPieces third textEnd equals: 11.
	
	aTextEditor selecter
		from: 10 to: 11;
		select.
	
	aTextEditor inserter
		atCursor;
		string: 'S';
		insert.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello WorlS'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	
	theNewPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theNewPieces size equals: 3.
	
	self assert: (theNewPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theNewPieces first textStart equals: 0.
	self assert: theNewPieces first textEnd equals: 5.
	
	self assert: (theNewPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theNewPieces second textStart equals: 5.
	self assert: theNewPieces second textEnd equals: 6.
	
	self assert: (theNewPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theNewPieces third textStart equals: 6.
	self assert: theNewPieces third textEnd equals: 11.
	
	"the state of old pieces should be at the moment of deletion, right before insertion"
	self assert: (theOldPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces first textStart equals: 0.
	self assert: theOldPieces first textEnd equals: 5.
	
	self assert: (theOldPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces second textStart equals: 5.
	self assert: theOldPieces second textEnd equals: 6.
	
	self assert: (theOldPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces third textStart equals: 6.
	self assert: theOldPieces third textEnd equals: 10.
	
	^ aTextEditor
]

{ #category : #'examples - overwrite' }
BrTextEditorLineSegmentExamples >> overwrite_llo_World_with_S_in_Hello_World [
	<gtExample>
	| aTextEditor aSegment theOldPieces theNewPieces |
	aTextEditor := self insert_Hello_World_inEmptyAt_0.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello World'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	
	theOldPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theOldPieces size equals: 3.
	
	self assert: (theOldPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces first textStart equals: 0.
	self assert: theOldPieces first textEnd equals: 5.
	
	self assert: (theOldPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces second textStart equals: 5.
	self assert: theOldPieces second textEnd equals: 6.
	
	self assert: (theOldPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces third textStart equals: 6.
	self assert: theOldPieces third textEnd equals: 11.
	
	aTextEditor selecter
		from: 2 to: 11;
		select.
	
	aTextEditor inserter
		atCursor;
		string: 'S';
		insert.

	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'HeS'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 3.
	
	theNewPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theNewPieces size equals: 1.
	
	self assert: (theNewPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theNewPieces first textStart equals: 0.
	self assert: theNewPieces first textEnd equals: 3.
	
	"the state of old pieces should be at the moment of deletion, right before insertion"
	self assert: (theOldPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces first textStart equals: 0.
	self assert: theOldPieces first textEnd equals: 2.
	
	self assert: (theOldPieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces second textStart equals: 2.
	self assert: theOldPieces second textEnd equals: 2.
	
	self assert: (theOldPieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theOldPieces third textStart equals: 2.
	self assert: theOldPieces third textEnd equals: 2.
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_HelloCr [
	<gtExample>
	| aTextEditor theFirstPieces theSecondPieces |
	
	aTextEditor := self insert_NewLine_in_Hello_At_5.
	
	theFirstPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theFirstPieces size equals: 1.
	
	self assert: (theFirstPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theFirstPieces first textStart equals: 0.
	self assert: theFirstPieces first textEnd equals: 5.
	self assert: (theFirstPieces first globalTextIndexToLocal: 0) equals: 0.
	self assert: (theFirstPieces first globalTextIndexToLocal: 1) equals: 1.
	self assert: (theFirstPieces first globalTextIndexToLocal: 2) equals: 2.
	self assert: (theFirstPieces first globalTextIndexToLocal: 3) equals: 3.
	self assert: (theFirstPieces first globalTextIndexToLocal: 4) equals: 4.
	self assert: (theFirstPieces first globalTextIndexToLocal: 5) equals: 5.
	
	theSecondPieces := aTextEditor segmentCollector segments second pieces.
	self assert: theSecondPieces size equals: 1.
	
	self assert: (theSecondPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theSecondPieces first textStart equals: 6.
	self assert: theSecondPieces first textEnd equals: 6.
	self assert: (theSecondPieces first globalTextIndexToLocal: 6) equals: 0.
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_HelloCrLf [
	<gtExample>
	| aTextEditor theFirstPieces theSecondPieces |
	
	aTextEditor := self insert_CrLf_in_Hello_At_5.
	
	theFirstPieces := aTextEditor segmentCollector segments first pieces.
	self assert: theFirstPieces size equals: 1.
	
	self assert: (theFirstPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theFirstPieces first textStart equals: 0.
	self assert: theFirstPieces first textEnd equals: 5.
	self assert: (theFirstPieces first globalTextIndexToLocal: 0) equals: 0.
	self assert: (theFirstPieces first globalTextIndexToLocal: 1) equals: 1.
	self assert: (theFirstPieces first globalTextIndexToLocal: 2) equals: 2.
	self assert: (theFirstPieces first globalTextIndexToLocal: 3) equals: 3.
	self assert: (theFirstPieces first globalTextIndexToLocal: 4) equals: 4.
	self assert: (theFirstPieces first globalTextIndexToLocal: 5) equals: 5.
	
	theSecondPieces := aTextEditor segmentCollector segments second pieces.
	self assert: theSecondPieces size equals: 1.
	
	self assert: (theSecondPieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: theSecondPieces first textStart equals: 6.
	self assert: theSecondPieces first textEnd equals: 6.
	self assert: (theSecondPieces first globalTextIndexToLocal: 6) equals: 0.
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_HelloCrWorldCr_WithAppendingAfterWorld [
	<gtExample>
	| aTextEditor aSegment thePieces |
	
	aTextEditor := self emptyEditor.
	aTextEditor text: self text_HelloCrWorldCr_WithAppendingAfterWorld.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 3.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	
	aSegment := aTextEditor segmentCollector segments second.
	self assert: aSegment index equals: 2.
	self assert: aSegment text asString equals: 'World'.
	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 11.
	
	aSegment := aTextEditor segmentCollector segments third.
	self assert: aSegment index equals: 3.
	self assert: aSegment text asString equals: ''.
	self assert: aSegment textStart equals: 12.
	self assert: aSegment textEnd equals: 12.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.

	self assert: (thePieces first text ~~ aTextEditor segmentCollector segments first text).
	
	thePieces := aTextEditor segmentCollector segments second pieces.
	self assert: thePieces size equals: 2.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 6.
	self assert: thePieces first textEnd equals: 11.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces second textStart equals: 6.
	self assert: thePieces second textEnd equals: 11.
	self assert: thePieces second adornmentAttribute shouldAppend.
	
	self assert: (thePieces first text ~~ thePieces second text).
	self assert: (thePieces first text ~~ aTextEditor segmentCollector segments second text).
	
	thePieces := aTextEditor segmentCollector segments third pieces.
	self assert: thePieces size equals: 1.

	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 12.
	self assert: thePieces first textEnd equals: 12.
	
	self assert: (thePieces first text ~~ aTextEditor segmentCollector segments third text).
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_Hello_1_WithAppending [
	<gtExample>
	| aTextEditor thePieces |
	
	aTextEditor := self emptyEditor.
	aTextEditor text: self text_Hello_1_WithAppending.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 4.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces second textStart equals: 5.
	self assert: thePieces second textEnd equals: 6.

	self assert: (thePieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces third textStart equals: 6.
	self assert: thePieces third textEnd equals: 7.
	
	self assert: (thePieces fourth isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces fourth textStart equals: 0.
	self assert: thePieces fourth textEnd equals: 7.
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_Hello_Smart_World_WithAppending [
	<gtExample>
	| aTextEditor thePieces |
	
	aTextEditor := self emptyEditor.
	aTextEditor text: self text_Hello_Smart_World_WithAppending.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 8.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces second textStart equals: 0.
	self assert: thePieces second textEnd equals: 5.
	
	self assert: thePieces first text ~~ thePieces second text.
	
	self assert: (thePieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces third textStart equals: 5.
	self assert: thePieces third textEnd equals: 6.
	
	self assert: (thePieces fourth isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces fourth textStart equals: 6.
	self assert: thePieces fourth textEnd equals: 11.
	
	self assert: (thePieces fifth isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces fifth textStart equals: 6.
	self assert: thePieces fifth textEnd equals: 11.
	
	self assert: thePieces fourth text ~~ thePieces fifth text.
	
	self assert: (thePieces sixth isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces sixth textStart equals: 11.
	self assert: thePieces sixth textEnd equals: 12.
	
	self assert: (thePieces seventh isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces seventh textStart equals: 12.
	self assert: thePieces seventh textEnd equals: 17.
	
	self assert: (thePieces eighth isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces eighth textStart equals: 12.
	self assert: thePieces eighth textEnd equals: 17.
	
	self assert: thePieces seventh text ~~ thePieces eighth text.
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_Hello_World [
	<gtExample>
	| aTextEditor thePieces |
	
	aTextEditor := self insert_Hello_World_inEmptyAt_0.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 3.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.
	self assert: (thePieces first globalTextIndexToLocal: 0) equals: 0.
	self assert: (thePieces first globalTextIndexToLocal: 1) equals: 1.
	self assert: (thePieces first globalTextIndexToLocal: 2) equals: 2.
	self assert: (thePieces first globalTextIndexToLocal: 3) equals: 3.
	self assert: (thePieces first globalTextIndexToLocal: 4) equals: 4.
	self assert: (thePieces first globalTextIndexToLocal: 5) equals: 5.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces second textStart equals: 5.
	self assert: thePieces second textEnd equals: 6.
	self assert: (thePieces second globalTextIndexToLocal: 5) equals: 0.
	self assert: (thePieces second globalTextIndexToLocal: 6) equals: 1.

	self assert: (thePieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces third textStart equals: 6.
	self assert: thePieces third textEnd equals: 11.
	self assert: (thePieces third globalTextIndexToLocal: 6) equals: 0.
	self assert: (thePieces third globalTextIndexToLocal: 7) equals: 1.
	self assert: (thePieces third globalTextIndexToLocal: 8) equals: 2.
	self assert: (thePieces third globalTextIndexToLocal: 9) equals: 3.
	self assert: (thePieces third globalTextIndexToLocal: 10) equals: 4.
	self assert: (thePieces third globalTextIndexToLocal: 11) equals: 5.
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_Hello_World_WithReplacementAndAppendingOfWorld [
	<gtExample>
	| aTextEditor thePieces aSegment |
	
	aTextEditor := self emptyEditor.
	aTextEditor text: self text_HelloCrWorld_WithReplacementAndAppendingOfWorld.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	
	aSegment := aTextEditor segmentCollector segments second.
	self assert: aSegment index equals: 2.
	self assert: aSegment text asString equals: 'World'.
	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 11.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.
	
	thePieces := aTextEditor segmentCollector segments second pieces.
	self assert: thePieces size equals: 2.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces first textStart equals: 6.
	self assert: thePieces first textEnd equals: 11.
	self assert: thePieces first adornmentAttribute shouldReplace.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces second textStart equals: 6.
	self assert: thePieces second textEnd equals: 11.
	self assert: thePieces second adornmentAttribute shouldAppend.
	
	"it is very important that pieces do not share same sub-text instance"
	self assert: (thePieces first text ~~ thePieces second text).
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_Hello_World_WithReplacementOf [
	<gtExample>
	| aTextEditor aSegment thePieces |
	
	aTextEditor := self emptyEditor.
	aTextEditor text: self text_HelloSpaceWorld_WithReplacementOfSpace.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello World'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 3.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces second textStart equals: 5.
	self assert: thePieces second textEnd equals: 6.
	self assert: thePieces second adornmentAttribute shouldReplace.
	
	self assert: (thePieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces third textStart equals: 6.
	self assert: thePieces third textEnd equals: 11.
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_Hello_World_WithReplacementOfLineBreak [
	<gtExample>
	| aTextEditor thePieces |
	
	aTextEditor := self emptyEditor.
	aTextEditor text: self text_Hello_World_WithReplacementOfLineBreak.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 1.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 3.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 3.
	
	self assert: (thePieces second isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces second textStart equals: 3.
	self assert: thePieces second textEnd equals: 8.

	self assert: (thePieces third isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces third textStart equals: 8.
	self assert: thePieces third textEnd equals: 11.
	
	^ aTextEditor
]

{ #category : #'examples - pieces' }
BrTextEditorLineSegmentExamples >> pieces_Hello_World_WithReplacementOfWorld [
	<gtExample>
	| aTextEditor aSegment thePieces |
	
	aTextEditor := self emptyEditor.
	aTextEditor text: self text_HelloCrWorld_WithReplacementOfWorld.
	
	self assert: aTextEditor segmentCollector computedSegmentsCount equals: 2.
	
	aSegment := aTextEditor segmentCollector segments first.
	self assert: aSegment index equals: 1.
	self assert: aSegment text asString equals: 'Hello'.
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	
	aSegment := aTextEditor segmentCollector segments second.
	self assert: aSegment index equals: 2.
	self assert: aSegment text asString equals: 'World'.
	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 11.
	
	thePieces := aTextEditor segmentCollector segments first pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentTextPiece).
	self assert: thePieces first textStart equals: 0.
	self assert: thePieces first textEnd equals: 5.
	
	thePieces := aTextEditor segmentCollector segments second pieces.
	self assert: thePieces size equals: 1.
	
	self assert: (thePieces first isKindOf: BrTextEditorLineSegmentAdornmentPiece).
	self assert: thePieces first textStart equals: 6.
	self assert: thePieces first textEnd equals: 11.
	self assert: thePieces first adornmentAttribute shouldReplace.
	
	^ aTextEditor
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_HelloCrWorld_0_to_5_to_be_0_to_11 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_HelloCrWorld_0_to_5.
	aSegment scopeText: 0 end: 11.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	self assert: aSegment textInterval equals: (0 to: 11).
	self assert: aSegment textLength equals: 11.
	self assert: aSegment text asString equals: 'Hello', String cr, 'World'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_HelloCrWorld_0_to_5_to_be_0_to_5 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_HelloCrWorld_0_to_5.
	aSegment scopeText: 0 end: 5.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textInterval equals: (0 to: 5).
	self assert: aSegment textLength equals: 5.
	self assert: aSegment text asString equals: 'Hello'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_HelloCrWorld_0_to_5_to_be_0_to_6 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_HelloCrWorld_0_to_5.
	aSegment scopeText: 0 end: 6.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 6.
	self assert: aSegment textInterval equals: (0 to: 6).
	self assert: aSegment textLength equals: 6.
	self assert: aSegment text asString equals: 'Hello', String cr.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_HelloCrWorld_0_to_5_to_be_1_to_5 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_HelloCrWorld_0_to_5.
	aSegment scopeText: 1 end: 5.
	
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textInterval equals: (1 to: 5).
	self assert: aSegment textLength equals: 4.
	self assert: aSegment text asString equals: 'ello'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_HelloCrWorld_0_to_5_to_be_3_to_5 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_HelloCrWorld_0_to_5.
	aSegment scopeText: 3 end: 5.
	
	self assert: aSegment textStart equals: 3.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textInterval equals: (3 to: 5).
	self assert: aSegment textLength equals: 2.
	self assert: aSegment text asString equals: 'lo'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_HelloCrWorld_6_to_11_to_be_0_to_11 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_HelloCrWorld_6_to_11.
	aSegment scopeText: 0 end: 11.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	self assert: aSegment textInterval equals: (0 to: 11).
	self assert: aSegment textLength equals: 11.
	self assert: aSegment text asString equals: 'Hello', String cr, 'World'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_HelloCrWorld_6_to_11_to_be_6_to_11 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_HelloCrWorld_6_to_11.
	aSegment scopeText: 6 end: 11.
	
	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 11.
	self assert: aSegment textInterval equals: (6 to: 11).
	self assert: aSegment textLength equals: 5.
	self assert: aSegment text asString equals: 'World'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_sub_HelloCrWorld_0_to_5_to_be_0_to_11 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_sub_HelloCrWorld_0_to_5.
	aSegment scopeText: 0 end: 11.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	self assert: aSegment textInterval equals: (0 to: 11).
	self assert: aSegment textLength equals: 11.
	self assert: aSegment text asString equals: 'Hello', String cr, 'World'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_sub_HelloCrWorld_0_to_5_to_be_0_to_5 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_sub_HelloCrWorld_0_to_5.
	aSegment scopeText: 0 end: 5.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textInterval equals: (0 to: 5).
	self assert: aSegment textLength equals: 5.
	self assert: aSegment text asString equals: 'Hello'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_sub_HelloCrWorld_0_to_5_to_be_0_to_6 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_sub_HelloCrWorld_0_to_5.
	aSegment scopeText: 0 end: 6.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 6.
	self assert: aSegment textInterval equals: (0 to: 6).
	self assert: aSegment textLength equals: 6.
	self assert: aSegment text asString equals: 'Hello', String cr.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_sub_HelloCrWorld_0_to_5_to_be_1_to_5 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_sub_HelloCrWorld_0_to_5.
	aSegment scopeText: 1 end: 5.
	
	self assert: aSegment textStart equals: 1.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textInterval equals: (1 to: 5).
	self assert: aSegment textLength equals: 4.
	self assert: aSegment text asString equals: 'ello'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_sub_HelloCrWorld_0_to_5_to_be_3_to_5 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_sub_HelloCrWorld_0_to_5.
	aSegment scopeText: 3 end: 5.
	
	self assert: aSegment textStart equals: 3.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textInterval equals: (3 to: 5).
	self assert: aSegment textLength equals: 2.
	self assert: aSegment text asString equals: 'lo'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_sub_HelloCrWorld_6_to_11_to_be_0_to_11 [
	<gtExample>
	| aSegment |

	aSegment := self segment_sub_HelloCrWorld_6_to_11.
	aSegment scopeText: 0 end: 11.

	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 11.
	self assert: aSegment textInterval equals: (0 to: 11).
	self assert: aSegment textLength equals: 11.
	self assert: aSegment text asString equals: 'Hello', String cr, 'World'.
	
	^ aSegment
]

{ #category : #'examples - scope' }
BrTextEditorLineSegmentExamples >> scope_segment_sub_HelloCrWorld_6_to_11_to_be_6_to_11 [
	<gtExample>
	| aSegment |
	
	aSegment := self segment_sub_HelloCrWorld_6_to_11.
	aSegment scopeText: 6 end: 11.
	
	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 11.
	self assert: aSegment textInterval equals: (6 to: 11).
	self assert: aSegment textLength equals: 5.
	self assert: aSegment text asString equals: 'World'.
	
	^ aSegment
]

{ #category : #'instance creation' }
BrTextEditorLineSegmentExamples >> segmentStream [
	<gtExample>
	
	^ BrEditorSegmentStream new limit: Float infinity
]

{ #category : #'instance creation - segment' }
BrTextEditorLineSegmentExamples >> segment_HelloCrWorld_0_to_5 [
	<gtExample>
	| aSegment |
	
	aSegment := BrTextEditorLineSegment new.
	aSegment initializeWith: (self text_HelloCrWorld from: 1 to: 5) from: 0 to: 5.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textInterval equals: (0 to: 5).
	self assert: aSegment textLength equals: 5.
	self assert: aSegment text asString equals: 'Hello'.
	
	^ aSegment
]

{ #category : #'instance creation - segment' }
BrTextEditorLineSegmentExamples >> segment_HelloCrWorld_6_to_11 [
	<gtExample>
	| aSegment |

	aSegment := BrTextEditorLineSegment new.
	aSegment initializeWith: (self text_HelloCrWorld from: 7 to: 11) from: 6 to: 11.

	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 11.
	self assert: aSegment textInterval equals: (6 to: 11).
	self assert: aSegment textLength equals: 5.
	self assert: aSegment text asString equals: 'World'.

	^ aSegment
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

	self assert: aSegment index equals: 3.

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
	| aTextEditor notFoundFlag |

	aTextEditor := self insert_NewLineCrLf_in_HACrBA_At_3.
	self assert: aTextEditor text size equals: 6.

	notFoundFlag := false.	
	aTextEditor segmentCollector
		cachedSegmentAt: 7
		ifFound: [ :aFoundSegment | ]
		ifNotFound: [ notFoundFlag := true ].

	self assert: notFoundFlag.

	^ aTextEditor
]

{ #category : #'instance creation - segment' }
BrTextEditorLineSegmentExamples >> segment_sub_HelloCrWorld_0_to_5 [
	<gtExample>
	| aSegment |
	
	aSegment := BrTextEditorLineSegment new.
	aSegment initializeWith: (self text_sub_HelloCrWorld from: 1 to: 5) from: 0 to: 5.
	
	self assert: aSegment textStart equals: 0.
	self assert: aSegment textEnd equals: 5.
	self assert: aSegment textInterval equals: (0 to: 5).
	self assert: aSegment textLength equals: 5.
	self assert: aSegment text asString equals: 'Hello'.
	
	^ aSegment
]

{ #category : #'instance creation - segment' }
BrTextEditorLineSegmentExamples >> segment_sub_HelloCrWorld_6_to_11 [
	<gtExample>
	| aSegment |

	aSegment := BrTextEditorLineSegment new.
	aSegment initializeWith: (self text_sub_HelloCrWorld from: 7 to: 11) from: 6 to: 11.

	self assert: aSegment textStart equals: 6.
	self assert: aSegment textEnd equals: 11.
	self assert: aSegment textInterval equals: (6 to: 11).
	self assert: aSegment textLength equals: 5.
	self assert: aSegment text asString equals: 'World'.

	^ aSegment
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
BrTextEditorLineSegmentExamples >> text_HelloCrWorld [
	<gtExample>

	^ ('Hello', String cr, 'World') asRopedText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_HelloCrWorldCr_WithAppendingAfterWorld [
	<gtExample>
	| aText |

	aText := ('Hello', String cr, 'World', String cr) asRopedText fontSize: 20.
	(aText from: 7 to: 11)
		appendingAdornment: [ BlElement new size: 6@6; background: Color red ].
		
	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_HelloCrWorldCr_WithReplacementOfWorld [
	<gtExample>
	| aText |

	aText := ('Hello', String cr, 'World', String cr) asRopedText fontSize: 20.
	(aText from: 7 to: 11)
		replacingAdornment: [ BlElement new size: 6@6; background: Color red ].
		
	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_HelloCrWorld_WithReplacementAndAppendingOfWorld [
	<gtExample>
	| aText |

	aText := self text_HelloCrWorld_WithReplacementOfWorld.
	(aText from: 7 to: 11)
		appendingAdornment: [ BlElement new size: 6@6; background: Color blue ].
		
	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_HelloCrWorld_WithReplacementOfWorld [
	<gtExample>
	| aText |

	aText := ('Hello', String cr, 'World') asRopedText fontSize: 20.
	(aText from: 7 to: 11)
		replacingAdornment: [ BlElement new size: 6@6; background: Color red ].
		
	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_HelloSpaceWorld_WithReplacementOfSpace [
	<gtExample>
	| aText |

	aText := ('Hello World') asRopedText fontSize: 20.
	(aText from: 6 to: 6)
		replacingAdornment: [ BlElement new size: 6@6; background: Color red ].
		
	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_Hello_1_WithAppending [
	<gtExample>
	| aText |

	aText := 'Hello 1' asRopedText.
	aText
		monospace;
		fontSize: 14;
		foreground: Color black.

	(aText from: aText size to: aText size)
		foreground: Color darkGray.

	aText appendingAdornment: [
		BlElement new
			size: 20@20;
			background: (Color gray alpha: 0.5);
			geometry: BlEllipse new ].

	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_Hello_Smart_World_WithAppending [
	<gtExample>
	| aText |

	aText := 'Hello Smart World' asRopedText.
	aText
		monospace;
		fontSize: 14;
		foreground: Color black.

	(aText from: 1 to: 5)
		foreground: Color black;
		bold;
		appendingAdornment: [
			BlElement new
				size: 16@16;
				background: (Color black alpha: 0.5);
				geometry: BlEllipse new ].
	
	(aText from: 7 to: 11)
		foreground: Color gray;
		bold;
		appendingAdornment: [
			BlElement new
				size: 16@16;
				background: (Color gray alpha: 0.5);
				geometry: BlEllipse new ].

	(aText from: 13 to: 17)
		foreground: Color lightGray;
		bold;
		appendingAdornment: [
			BlElement new
				size: 16@16;
				background: (Color lightGray alpha: 0.5);
				geometry: BlEllipse new ].

	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_Hello_World [
	<gtExample>

	^ BlSubText text: (BlRopedText string: 'Hello World')
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_Hello_World_Cr_WithReplacement [
	<gtExample>
	| aText |

	aText := ('Hello', String cr, String cr, 'World', String cr) asRopedText fontSize: 20.
	(aText from: 8 to: 12)
		replacingAdornment: [ BlElement new size: 6@6; background: Color red ].
		
	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_Hello_World_WithReplacementAndAppendingOfLineBreak [
	<gtExample>
	| aText |

	aText := self text_Hello_World_WithReplacementOfLineBreak.
	(aText from: 4 to: 8)
		appendingAdornment: [ BlElement new size: 6@6; background: Color blue ].	
	
	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_Hello_World_WithReplacementOfLineBreak [
	<gtExample>
	| aText |

	aText := ('Hello', String cr, 'World') asRopedText fontSize: 20.
	(aText from: 4 to: 8)
		replacingAdornment: [ BlElement new size: 6@6; background: Color red ].
		
	^ aText
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_empty [
	<gtExample>

	^ BlRopedText string: ''
]

{ #category : #'instance creation - text' }
BrTextEditorLineSegmentExamples >> text_sub_HelloCrWorld [
	<gtExample>

	^ ('How are you', String cr, 'Hello', String cr, 'World') asRopedText from: 13 to: 23
]
