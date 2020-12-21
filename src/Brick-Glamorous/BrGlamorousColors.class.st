"
I define colors used for Glamorous Toolkit.

Here is the list of available colors: ${class:BrGlamorousColors|show=gtColorsFor:|expanded=true}$
"
Class {
	#name : #BrGlamorousColors,
	#superclass : #SharedPool,
	#classVars : [
		'ActiveColor',
		'BackdropColor',
		'ButtonBackgroundColor',
		'ButtonBorderColor',
		'ButtonTextColor',
		'DarkBorderColor',
		'DeselectedListItemBackgroundColor',
		'DisabledButtonBackgroundColor',
		'DisabledButtonBorderColor',
		'DisabledButtonTextColor',
		'DisabledHeaderTextColor',
		'EditorBorderColor',
		'ErrorBackgroundColor',
		'ErrorBorderColor',
		'ExpandCollapseTriangleBackgroundColor',
		'FailureBackgroundColor',
		'FailureBorderColor',
		'FocusedEditorBorderColor',
		'HeaderBackgroundColor',
		'HeaderTextColor',
		'HoveredButtonBorderColor',
		'HoveredButtonTextColor',
		'HoveredListItemBackgroundColor',
		'LightBorderColor',
		'LinkColor',
		'LinkWithErrorColor',
		'NeutralBackgroundColor',
		'NewsBackgroundColor',
		'PressedButtonBorderColor',
		'PressedButtonTextColor',
		'PressedListItemBackgroundColor',
		'PrimaryBorderColor',
		'SecondaryHeaderBackgroundColor',
		'SelectedListItemBackgroundColor',
		'ShadowColor',
		'SuccessBackgroundColor',
		'SuccessBorderColor',
		'TextHighlightColor'
	],
	#category : #'Brick-Glamorous-Colors, Icons, Fonts'
}

{ #category : #accessing }
BrGlamorousColors class >> backdropColor [
	^ BackdropColor
]

{ #category : #accessing }
BrGlamorousColors class >> darkBorderColor [
	^ DarkBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> darkBorderColor: anObject [
	DarkBorderColor := anObject
]

{ #category : #'button - background' }
BrGlamorousColors class >> defaultButtonBackgroundColor [
	^ ButtonBackgroundColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> defaultButtonBackgroundColor: anObject [
	ButtonBackgroundColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> defaultButtonBorderColor [
	^ ButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> defaultButtonBorderColor: anObject [
	ButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> defaultButtonTextColor [
	^ ButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> defaultButtonTextColor: anObject [
	ButtonTextColor := anObject
]

{ #category : #'header - background' }
BrGlamorousColors class >> defaultHeaderBackgroundColor [
	^ HeaderBackgroundColor
]

{ #category : #'header - text' }
BrGlamorousColors class >> defaultHeaderTextColor [
	^ HeaderTextColor
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> defaultListItemColor [
	^ self deselectedListItemColor
]

{ #category : #accessing }
BrGlamorousColors class >> defaultShadowColor [
	^ ShadowColor
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> deselectedListItemColor [
	^ DeselectedListItemBackgroundColor
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> deselectedtListItemColor: aColor [
	DeselectedListItemBackgroundColor := aColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> disabledButtonBackgroundColor [
	^ DisabledButtonBackgroundColor
]

{ #category : #'button - background' }
BrGlamorousColors class >> disabledButtonBackgroundColor: anObject [
	DisabledButtonBackgroundColor := anObject
]

{ #category : #'button - border' }
BrGlamorousColors class >> disabledButtonBorderColor [
	^ DisabledButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> disabledButtonBorderColor: anObject [
	DisabledButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> disabledButtonTextColor [
	^ DisabledButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> disabledButtonTextColor: anObject [
	DisabledButtonTextColor := anObject
]

{ #category : #'header - text' }
BrGlamorousColors class >> disabledHeaderTextColor [
	^ DisabledHeaderTextColor
]

{ #category : #accessing }
BrGlamorousColors class >> distinctTenLightColors [
	"This is a list of 10 light colors that can be distinguished b
	the typical human eye even when seen together in the same picture.
	They complement the distinctTenStrongColors.
	They are described in the Show Me the Numbers book by Stephen Few"

	^ OrderedCollection new
		"red"
		add: (Color 
					h: Color red hue
					s: 0.3
					v: Color red brightness);
		"blue"
		add: (Color 
					h: Color blue hue
					s: 0.3
					v: Color blue brightness);
		"orange"
		add: (Color 
					h: Color orange hue
					s: 0.3
					v: Color orange brightness);
		"cyan"
		add: (Color 
					h: Color cyan hue
					s: 0.3 
					v: Color cyan brightness );
		"green"
		add: (Color 
					h: Color lightGreen hue
					s: 0.1
					v: 0.7);
		"pink"
		add: (Color 
					h: Color pink hue
					s: 0.1
					v: Color pink brightness);
		"brown"
		add: (Color 
					h: Color brown hue
					s: 0.2
					v: 1 );
		"purple"
		add: (Color 
					h: Color purple hue
					s: 0.2
					v: Color purple brightness );
		"yellow"
		add: (Color 
					h: Color yellow hue
					s: 0.3
					v: Color yellow brightness);
		"gray"
		add: (Color veryLightGray);
		yourself;


		yourself
]

{ #category : #accessing }
BrGlamorousColors class >> distinctTenStrongColors [
	"This is a list of 10 light colors that can be distinguished b
	the typical human eye even when seen together in the same picture.
	They complement the distinctTenLightColors.
	They are described in the Show Me the Numbers book by Stephen Few"

	^ (OrderedCollection new)
			add: Color red;
			add: Color blue;
			add: Color orange;
			add: Color cyan;
			add: Color green;
			add: Color pink;
			add: Color brown;
			add: Color purple;
			add: Color yellow;
			add: Color gray;
			yourself
]

{ #category : #'editor - border' }
BrGlamorousColors class >> editorBorderColor [
	^ EditorBorderColor
]

{ #category : #'editor - border' }
BrGlamorousColors class >> editorBorderColor: anObject [
	EditorBorderColor := anObject
]

{ #category : #'status - background' }
BrGlamorousColors class >> errorBackgroundColor [
	^ ErrorBackgroundColor
]

{ #category : #'status - background' }
BrGlamorousColors class >> errorBackgroundColor: aColor [
	ErrorBackgroundColor := aColor
]

{ #category : #'status - border' }
BrGlamorousColors class >> errorBorderColor [
	^ ErrorBorderColor
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> expandCollapseTriangleBackgroundColor [
	^ ExpandCollapseTriangleBackgroundColor
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> expandCollapseTriangleBackgroundColor: aColor [
	ExpandCollapseTriangleBackgroundColor := aColor
]

{ #category : #'status - background' }
BrGlamorousColors class >> failureBackgroundColor [
	^ FailureBackgroundColor
]

{ #category : #'status - background' }
BrGlamorousColors class >> failureBackgroundColor: aColor [
	FailureBackgroundColor := aColor
]

{ #category : #'status - border' }
BrGlamorousColors class >> failureBorderColor [
	^ FailureBorderColor
]

{ #category : #'editor - border' }
BrGlamorousColors class >> focusedEditorBorderColor [
	^ FocusedEditorBorderColor
]

{ #category : #'editor - border' }
BrGlamorousColors class >> focusedEditorBorderColor: anObject [
	FocusedEditorBorderColor := anObject
]

{ #category : #'list and tree items - border' }
BrGlamorousColors class >> focusedListItemBorder [
	^ self primaryBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> hoveredButtonBorderColor [
	^ HoveredButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> hoveredButtonBorderColor: anObject [
	HoveredButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> hoveredButtonTextColor [
	^ HoveredButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> hoveredButtonTextColor: anObject [
	HoveredButtonTextColor := anObject
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> hoveredListItemColor [
	^ HoveredListItemBackgroundColor
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> hoveredListItemColor: aColor [
	HoveredListItemBackgroundColor := aColor
]

{ #category : #initialization }
BrGlamorousColors class >> initialize [
	LightBorderColor := Color fromHexString: #d9d9d9.
	DarkBorderColor := Color darkGray.
	PrimaryBorderColor := Color fromHexString: #'45abfe'.
	ActiveColor := Color fromHexString: #'096dd9'.

	"buttons - border"
	ButtonBorderColor := LightBorderColor.
	HoveredButtonBorderColor := PrimaryBorderColor.
	PressedButtonBorderColor := ActiveColor.
	DisabledButtonBorderColor := LightBorderColor.

	"status - border"
	SuccessBorderColor := Color fromHexString: #'389e0d' "green-7".
	ErrorBorderColor := Color fromHexString: #'cf1322' "red-7".
	FailureBorderColor := Color fromHexString: #'d48806' "gold-7".

	"buttons - background"
	ButtonBackgroundColor := Color white.
	DisabledButtonBackgroundColor := Color fromHexString: #f5f5f5 "grey-3".
	
	"status - background"
	ErrorBackgroundColor := Color fromHexString: #ff7875 "red-4".
	SuccessBackgroundColor := Color fromHexString: #'95de64' "green-4".
	FailureBackgroundColor := Color fromHexString: #ffd666 "gold-4".
	NeutralBackgroundColor := Color fromHexString: #'f0f0f0' "gray-4".
	NewsBackgroundColor := Color fromHexString: #'fff1b8' "gold-2".
	
	"buttons - text"
	ButtonTextColor := Color black alpha: 0.65.
	HoveredButtonTextColor := PrimaryBorderColor.
	PressedButtonTextColor := ActiveColor.
	DisabledButtonTextColor := Color black alpha: 0.25.

	"background"
	BackdropColor := Color r: 240 g: 240 b: 240 range: 255.
	ShadowColor := Color r: 200 g: 200 b: 200 range: 255.
	
	"header - background"
	HeaderBackgroundColor := Color fromHexString: #'d9d9d9'. "grey-5"
	SecondaryHeaderBackgroundColor := Color fromHexString: #'e8e8e8'. "grey-6"
	
	"header - text"
	HeaderTextColor := Color black alpha: 0.85.
	DisabledHeaderTextColor := Color black alpha: 0.25.
	
	"highlighting - text"
	TextHighlightColor := Color fromHexString: #ffd666.
	
	"list and tree items"
	DeselectedListItemBackgroundColor := Color transparent.
	HoveredListItemBackgroundColor := Color gray alpha: 0.1.
	SelectedListItemBackgroundColor := Color gray alpha: 0.2.
	PressedListItemBackgroundColor := Color gray alpha: 0.2. 
	ExpandCollapseTriangleBackgroundColor := Color gray.

	"editors"
	EditorBorderColor := LightBorderColor.
	FocusedEditorBorderColor := PrimaryBorderColor.
	
	"others"
	LinkColor := Color fromHexString: #'096dd9'.
	LinkWithErrorColor := Color fromHexString: #cf1322.
]

{ #category : #accessing }
BrGlamorousColors class >> lightBorderColor [
	^ LightBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> lightBorderColor: anObject [
	LightBorderColor := anObject
]

{ #category : #links }
BrGlamorousColors class >> linkColor [
	^ LinkColor
]

{ #category : #links }
BrGlamorousColors class >> linkWithErrorColor [
	^ LinkWithErrorColor
]

{ #category : #'status - background' }
BrGlamorousColors class >> neutralBackgroundColor [
	^ NeutralBackgroundColor
]

{ #category : #accessing }
BrGlamorousColors class >> newsBackgroundColor [
	^ NewsBackgroundColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> pressedButtonBorderColor [
	^ PressedButtonBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> pressedButtonBorderColor: anObject [
	PressedButtonBorderColor := anObject
]

{ #category : #'button - text' }
BrGlamorousColors class >> pressedButtonTextColor [
	^ PressedButtonTextColor
]

{ #category : #'button - text' }
BrGlamorousColors class >> pressedButtonTextColor: anObject [
	PressedButtonTextColor := anObject
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> pressedListItemColor [
	^ PressedListItemBackgroundColor 
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> pressedListItemColor: aColor [
	PressedListItemBackgroundColor := aColor
]

{ #category : #accessing }
BrGlamorousColors class >> primaryBorderColor [
	^ PrimaryBorderColor
]

{ #category : #accessing }
BrGlamorousColors class >> primaryBorderColor: anObject [
	PrimaryBorderColor := anObject
]

{ #category : #'header - background' }
BrGlamorousColors class >> secondaryHeaderBackgroundColor [
	^ SecondaryHeaderBackgroundColor
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> selectedListItemColor [
	^ SelectedListItemBackgroundColor
]

{ #category : #'list and tree items - background' }
BrGlamorousColors class >> selectedListItemColor: aColor [
	SelectedListItemBackgroundColor := aColor
]

{ #category : #accessing }
BrGlamorousColors class >> shadowColor [
	^ ShadowColor
]

{ #category : #'status - background' }
BrGlamorousColors class >> successBackgroundColor [
	^ SuccessBackgroundColor
]

{ #category : #'status - background' }
BrGlamorousColors class >> successBackgroundColor: aColor [
	SuccessBackgroundColor := aColor
]

{ #category : #'status - border' }
BrGlamorousColors class >> successBorderColor [
	^ SuccessBorderColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> textHighlightColor [
	^ TextHighlightColor
]

{ #category : #'button - border' }
BrGlamorousColors class >> textHighlightColor: anObject [
	TextHighlightColor := anObject
]
