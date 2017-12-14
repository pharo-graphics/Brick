accessing
defaultSegmentLayout
	^ (defaultSegmentLayoutBlock ifNil: [ BrEditorTextFlowLayout new ]) value