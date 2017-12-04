*Brick-Editor
editorAction
	<pageAction>

	^ GLMAction new
		action: [ :aPresentation :aPage |
			aPage switchNext.
			aPresentation update ];
		title: 'Next step';
		icon: (Smalltalk ui icons iconNamed: #forward);
		condition: [ :aPresentation :aPage |
			(aPage isKindOf: BrTextEditorDemoPlayPage)
				and: [ aPage hasNext ] ];
		yourself