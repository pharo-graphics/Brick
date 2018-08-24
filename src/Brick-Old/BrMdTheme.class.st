Class {
	#name : #BrMdTheme,
	#superclass : #BrTheme,
	#category : 'Brick-Old'
}

{ #category : #'as yet unclassified' }
BrMdTheme class >> load [
	"self load"

	super load
]

{ #category : #'as yet unclassified' }
BrMdTheme class >> themeKey [
	^ #material
]

{ #category : #'as yet unclassified' }
BrMdTheme class >> unload [
	"self unload"

	super unload
]

{ #category : #'accessing structure variables' }
BrMdTheme >> button: aStylesheet [
	<stylesheet:#button priority:90>
		
	(BrStylesheetBuilder on: aStylesheet)
		cls: #button style:[ :b | b
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
]

{ #category : #'instance creation' }
BrMdTheme >> buttonOutlined: aStylesheet [
	<stylesheet: #buttonOutlined priority: 80>
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
		
		
]

{ #category : #'form-scripting' }
BrMdTheme >> checkbox: aStylesheet [
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
		
]

{ #category : #'as yet unclassified' }
BrMdTheme >> coloredButtons: aStylesheet [
	<stylesheet:#coloredButtons priority:80>
	self defineButtonWith: (BrMdButtonDarkPalette colorNamed: #blue) for: aStylesheet.
	self defineButtonWith: (BrMdButtonDarkPalette colorNamed: #green) for: aStylesheet.
	self defineButtonWith: (BrMdButtonDarkPalette colorNamed: #red) for: aStylesheet
]

{ #category : #'as yet unclassified' }
BrMdTheme >> defineButtonWith: aPalette for: aStylesheet [
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
]

{ #category : #'as yet unclassified' }
BrMdTheme >> oldCcoloredButtons: aStylesheet [
	
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
]

{ #category : #'instance creation' }
BrMdTheme >> radio: aStylesheet [
	<stylesheet:#radio priority:80>
	(BrStylesheetBuilder on: aStylesheet)
		cls:#radio style:[ :r | r
			
			declare: #color -> BrMdColor grey900;
			declare: #fontSize -> 12 asBrPx;
			
			on:#disabled style:[ :rd | rd
				declare: #color -> BrMdColor grey400;
				
				cls:#box style:[ :rdb | rdb 
					declare: #borderColor -> BrMdColor grey400
				]	
			];
		
			cls:#box style:[ :rb | rb 
				declare: #backgroundColor -> BrMdColor white;
				declare: #borderWidth -> 2 asBrPx;
				declare: #borderColor -> BrMdColor grey500
			];
		
			cls:#mark style:[ :rm | rm 
				declare: #backgroundColor -> BrMdColor grey500
			]		
		].
	
	
	
]
