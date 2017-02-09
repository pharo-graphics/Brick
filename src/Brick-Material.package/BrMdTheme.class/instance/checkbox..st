form-scripting
checkbox: aStylesheet
	<stylesheet:#checkbox priority:80>
	(BrStylesheetBuilder on: aStylesheet)
	
		cls: #checkbox style:[ :c | c
			declare: #color -> BrMdColor grey900;
			declare:#fontSize -> 12 asBrPx;
			
			cls: #box style:[ :cb | cb
				declare: #backgroundColor -> BrMdColor white;
				declare: #borderWidth -> 2 asBrPx;
				declare: #borderColor -> BrMdColor grey500
			];	
			
			on: #checked style:[ :cc | cc
				cls:#box style:[ :ccb | ccb
					declare: #backgroundColor -> BrMdColor grey500
				]
			];
		
			on: #disabled style:[ :cd | cd
				declare: #color -> BrMdColor grey400;
				cls:#box style:[ :cdb | cdb
					declare: #borderColor -> BrMdColor grey400
				]
			];
			cls: #box style:[:cb| cb
				cls: #mark style:[:cbm| cbm
					declare: #backgroundColor -> BrMdColor white
				]
			];
			on: #indeterminate style:[ :ci | ci
				cls: #box style:[:cib| cib
					cls: #mark style:[:cibm| cibm
						declare: #backgroundColor -> BrMdColor grey500
					]
				]
			];
			cls: #ripple style:[:cr| cr
				declare: #backgroundColor -> (BrMdColor white alpha:0);
				declareTransition: #backgroundColor -> {200 asBrMs. #linear }
			];
			on: #pressed style:[ :cp | cp
				cls:#ripple style:[ :cpr | cpr
					declare: #backgroundColor -> (BrMdColor grey400 alpha: 0.2)
				]
			]
		]
		