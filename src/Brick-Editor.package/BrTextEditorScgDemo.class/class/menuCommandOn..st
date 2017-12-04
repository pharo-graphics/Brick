world menu
menuCommandOn: aBuilder
	<worldMenu>

	(aBuilder item: #'SCG - Moldable Editor')
		order: 1.0;
		target: self;
		iconName: #glamorousGo.

	(aBuilder item: #'1. Rope')
		order: 0.1;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self ropeTree ].
	(aBuilder item: #'2. Model and UI')
		order: 0.2;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ self uiModel ].
	(aBuilder item: #'3. Two windows - one editor')
		order: 0.3;
		iconName: #catalogIcon;
		parent: #'SCG - Moldable Editor';
		action: [ BlUniverse reset. BrTextEditorExamples exampleOneEditorTwoElements ].
	
	(aBuilder item: #'Reset')
		order: 3.0;
		iconName: #catalogIcon; 
		parent: #'SCG - Moldable Editor';
		action: [ BlUniverse reset. BrTextEditorAttributedLineSegmentHolder cleanUp. BrTextEditor cleanUp ].