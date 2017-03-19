initialization
editor: anEditor

	editor := anEditor.
	collector := BrEditorSegmentCollector new.
	editor builder segmentsIn: collector for: editor subject.
	interval := 1 to: collector segments size