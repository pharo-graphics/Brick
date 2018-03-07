as yet unclassified
defineButtonWith: aPalette for: aStylesheet
	(BrStylesheetBuilder on: aStylesheet)
	
		cls: {#button. aPalette name } style:[ :bb | bb
				declare: #backgroundColor -> aPalette backgroundColor;
				declare: #borderColor -> aPalette borderColor;
				declare: #color -> aPalette text color;
				
				cls:#icon style:[:bbi| bbi
					declare: #backgroundColor -> aPalette icon backgroundColor
				];
			
				on:#hovered style:[:bbh| bbh
					declare: #backgroundColor -> aPalette hovered backgroundColor
				];
			
				on:#pressed style:[:bbh| bbh
					declare: #backgroundColor -> aPalette pressed backgroundColor;
					declare: #borderColor -> aPalette pressed borderColor
				]
		]