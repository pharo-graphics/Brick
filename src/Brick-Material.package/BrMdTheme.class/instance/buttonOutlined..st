instance creation
buttonOutlined: aStylesheet
	<stylesheet:#buttonOutlined priority:80>
	(BrStylesheetBuilder on: aStylesheet)
		
		cls:#(button outlined) style:[:bo| bo
			
			declare: #backgroundColor -> BrMdColor transparent;
			declare: #borderColor -> BrMdColor grey500;
			declare: #borderWidth -> 1 asBrPx;
			declare: #color -> BrMdColor grey600;
			declare: #boxShadow -> nil;
			
			cls:#icon style:[:boi| boi
				declare: #backgroundColor -> BrMdColor grey600
			];
		
			on:#hovered style:[:boh| boh
				declare: #backgroundColor -> BrMdColor transparent;
				declare: #boxShadow -> nil
			];
		
			on:#pressed style:[:bop| bop
				declare: #backgroundColor -> BrMdColor grey500;
				declare: #color -> BrMdColor white;
				
				cls:#icon style:[:bopi| bopi
					declare: #backgroundColor -> BrMdColor white
				]
			]
		]
		
		