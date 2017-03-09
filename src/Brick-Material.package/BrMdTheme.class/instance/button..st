accessing structure variables
button: aStylesheet
	<stylesheet:#button priority:90>
	(BrStylesheetBuilder on: aStylesheet)
	
		cls:#button style:[ :b | b
			
				declare: #backgroundColor -> BrMdColor grey100;
				declare: #borderWidth -> 1 asBrPx;
				declare: #borderColor -> BrMdColor grey200;
				declare: #color -> BrMdColor grey900;
				declare: #fontSize -> 12 asBrPx;
				declare: #boxShadow -> {1 asBrPx. 2 asBrPx. 2 asBrPx. BrMdColor grey400};
				declareTransition: #backgroundColor -> {100 asBrMs. #linear };
				
				on:#hovered style:[ :bh | bh
					declare: #backgroundColor -> BrMdColor grey200
				];
				
				on:#pressed style:[ :bp | bp
					declare: #backgroundColor -> BrMdColor grey300;
					declare: #borderColor -> BrMdColor grey300;
					declare: #boxShadow -> {1 asBrPx. 2 asBrPx. 2 asBrPx. BrMdColor grey500};
					
					cls:#ripple style:[ :br | br
						declare: #backgroundColor -> (BrMdColor grey400 alpha: 0.2)
					]
				];
			
				on:#disabled style:[ :bd | bd
					declare: #color -> BrMdColor grey600;
					declare: #borderColor -> BrMdColor grey300;
					declare: #backgroundColor -> BrMdColor grey300
				];
			
				cls:#icon style:[ :bi | bi
					declare: #backgroundColor -> BrMdColor grey900
				];
			
				cls:#ripple style:[ :br | br
					declare: #backgroundColor -> (BrMdColor white alpha:0);
					declareTransition: #backgroundColor -> {200 asBrMs. #linear }
				]
				
		]