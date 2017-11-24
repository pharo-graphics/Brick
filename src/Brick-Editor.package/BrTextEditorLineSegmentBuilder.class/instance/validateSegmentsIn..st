private
validateSegmentsIn: aTextEditor
	"Validate integrity of the segments.
	Return true if everything is ok, false otherwise"
	<return: #Symbol>
	| aPreviousSegment |
	
	aPreviousSegment := nil.

	aTextEditor segmentCollector segments do: [ :aTextEditorLineSegment |
		(aTextEditorLineSegment isEmpty and: [ aTextEditorLineSegment textStart > 0 and: [ aTextEditorLineSegment textEnd > 0 ] ])
			ifTrue: [ ^ false -> ('empty segment' -> aTextEditorLineSegment) ].

		aTextEditorLineSegment textStart > aTextEditorLineSegment textEnd
			ifTrue: [ ^ false -> ('start is bigger then end' -> aTextEditorLineSegment). ].
		
		aTextEditorLineSegment textLength < 1
			ifTrue: [ ^ false -> ('segment has zero length' -> aTextEditorLineSegment) ].

		aPreviousSegment
			ifNotNil: [
				(aTextEditorLineSegment asString anySatisfy: #isLineBreak)
					ifTrue: [ (aTextEditorLineSegment textLength = 1 and: [ (aTextEditorLineSegment text at: 1) isLineBreak ])
						ifFalse: [ ^ false -> ('new line segment is broken' -> aTextEditorLineSegment) ] ].

				(aPreviousSegment asString anySatisfy: #isLineBreak)
					ifTrue: [ (aPreviousSegment textLength = 1 and: [ (aPreviousSegment text at: 1) isLineBreak ])
						ifFalse: [ ^ false -> ('new line segment is broken' -> aPreviousSegment) ] ].
				
				"both are new lines"
				((aTextEditorLineSegment asString anySatisfy: #isLineBreak) and: [ (aPreviousSegment asString anySatisfy: #isLineBreak) ])
					ifTrue: [ (aTextEditorLineSegment textStart = (aPreviousSegment textEnd + 1))
						ifFalse: [ ^ false -> ('two new line segments are not in sync' -> {aPreviousSegment. aTextEditorLineSegment}) ] ].
				
				"current segment is new line, previous one is not"
				((aTextEditorLineSegment asString anySatisfy: #isLineBreak) and: [ (aPreviousSegment asString anySatisfy: #isLineBreak) not ])
					ifTrue: [ (aTextEditorLineSegment textStart = (aPreviousSegment textEnd + 1))
						ifFalse: [ ^ false -> ('new line segment is not in sync with the previous' -> {aPreviousSegment. aTextEditorLineSegment}) ] ].
				
				"prevuous segment is a new line, current one is not"
				((aTextEditorLineSegment asString anySatisfy: #isLineBreak) not and: [ (aPreviousSegment asString anySatisfy: #isLineBreak) ])
					ifTrue: [ (aTextEditorLineSegment textStart = (aPreviousSegment textEnd + 2))
						ifFalse: [ ^ false -> ('previous new line segment is not in sync with the current one' -> {aPreviousSegment. aTextEditorLineSegment}) ] ].
				
				"both segments are not new lines"
				((aTextEditorLineSegment asString anySatisfy: #isLineBreak) not and: [ (aPreviousSegment asString anySatisfy: #isLineBreak) not ])
					ifTrue: [ (aTextEditorLineSegment textStart = (aPreviousSegment textEnd + 2))
						ifFalse: [ ^ false -> ('two normal segments are not in sync' -> {aPreviousSegment. aTextEditorLineSegment}) ] ] ].
			aPreviousSegment := aTextEditorLineSegment ].

	^ (true -> 'ok')