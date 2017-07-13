collector - accessing
removeSegmentsFor: anEditorBuilder
	| aFirstIndex |

	aFirstIndex := self segments
		detect: [ :aSegment | aSegment builder = anEditorBuilder ]
		ifFound: [ :aSegment | aSegment index ]
		ifNone: [ 0 ].
	self segments removeAllSuchThat: [ :aSegment | aSegment builder = anEditorBuilder ].
	^ aFirstIndex