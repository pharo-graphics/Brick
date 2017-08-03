selection
updateSelection: aCollectionOfTextElements
	| aSelection aSelectionInterval |

	aSelection := self editor selection.
	aSelectionInterval := self editor selection interval.

	pieceElements do: [ :aTextElement |
		| textInterval |
		textInterval := aTextElement text start to: aTextElement text end.
		(aSelection overlaps: textInterval)
			ifTrue: [
				| localFrom localTo |
				localFrom := (aSelectionInterval first - aTextElement text start + 1) max: 0.
				localTo := (aSelectionInterval last - aTextElement text start + 1) min: aTextElement text size + 1.
				aTextElement select: localFrom to: localTo ]
			ifFalse: [ aTextElement selectNone ]	]