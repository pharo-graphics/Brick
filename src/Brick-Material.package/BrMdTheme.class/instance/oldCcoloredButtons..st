as yet unclassified
oldCcoloredButtons: aStylesheet
	
	(BrStylesheetBuilder on: aStylesheet)
	
		cls: #(button blue) style:[ :bb | bb
				declare: #backgroundColor -> BrMdColor blue700;
				declare: #borderColor -> BrMdColor blue800;
				declare: #color -> BrMdColor white;
				
				cls:#icon style:[:bbi| bbi
					declare: #backgroundColor -> BrMdColor white
				];
			
				on:#hovered style:[:bbh| bbh
					declare: #backgroundColor -> BrMdColor blue800
				];
			
				on:#pressed style:[:bbh| bbh
					declare: #backgroundColor -> BrMdColor blue900;
					declare: #borderColor -> BrMdColor blue900
				]
		];
	
		cls: #(button green) style:[ :r | r
				declare: #backgroundColor -> BrMdColor green700;
				declare: #borderColor -> BrMdColor green800;
				declare: #color -> BrMdColor white;
				
				cls:#icon style:[:bbi| bbi
					declare: #backgroundColor -> BrMdColor white
				];
			
				on:#hovered style:[:bbh| bbh
					declare: #backgroundColor -> BrMdColor green800
				];
			
				on:#pressed style:[:bbh| bbh
					declare: #backgroundColor -> BrMdColor green900;
					declare: #borderColor -> BrMdColor green900
				]
		]