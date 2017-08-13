selection - management
updateSelection: aTextElement of: aLineSegment in: aTextEditor
	
	aTextElement selectNone.
		
	(aTextEditor selection + aTextEditor selectionRecorder selection) do: [ :aSelection |
		| aSelectionInterval textInterval |
		aSelectionInterval := aSelection interval.
		textInterval := BlTextSelection from: aTextElement text start to: aTextElement text end.
		(aSelection overlaps: textInterval)
			ifTrue: [
				| localFrom localTo |
				localFrom := (aSelectionInterval first - aTextElement text start + 1) max: 0.
				localTo := (aSelectionInterval last - aTextElement text start + 1) min: aTextElement text size + 1.
				aTextElement select: localFrom to: localTo ] ]