Class {
	#name : #BrSlideImageExport,
	#superclass : #BrFileSelectOrCreate,
	#instVars : [
		'formatInputField',
		'heightInputField',
		'widthInputField',
		'exportOptionsCollection',
		'formatOptionsCollection',
		'rangeInputField'
	],
	#category : #'Brick-File - UI'
}

{ #category : #accessing }
BrSlideImageExport >> buildUI [
	| alignedButton fileInputFieldLabel fileInputFieldContainer formatSection resolutionSection rangeSection imageDetailsContainer |
	
	formatOptionsCollection := {'JPEG'. 'PNG'} asOrderedCollection.
	exportOptionsCollection := {'All'. 'Current Slide'. 'Range'} asOrderedCollection.
	
	breadcrumb := self createBreadcrumb.
	table := self createTable.
	table
		when: BrSelectionChanged
		do: [ :anEvent | 
			anEvent indices
				ifNotEmpty: [ :theIndices | 
					| aWidgetElement selectedObject |
					aWidgetElement := anEvent currentTarget.
					selectedObject := aWidgetElement viewModel
						itemAt: theIndices first.
					fileInputField text: selectedObject basename ] ].
	fileInputFieldContainer := self createFileInputField.
	
	formatSection := self createFormatInputSection.
	resolutionSection := self createResolutionSection.
	rangeSection := self createRangeSection.
	imageDetailsContainer := BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [:c |
			c vertical fitContent.
			c horizontal matchParent];
		margin: (BlInsets top: 20 right: 5 bottom: 5 left: 0);
		addChildren: {formatSection. resolutionSection. rangeSection}.
		
	alignedButton := self createOkButton.
	self addChildren: {
		BrScrollPane new
			look: BrScrollPaneLook;
			hMatchParent;
			vFitContent;
			content: breadcrumb.
		table.
		fileInputFieldContainer.
		imageDetailsContainer.
		alignedButton }.
]

{ #category : #accessing }
BrSlideImageExport >> createDropdownButtonWithLabel: aString [
	^ BrButton new
		look:
			BrTextLabelLook new glamorousRegularFont glamorousCodeSmallSize
				+ BrGlamorousButtonIconLook + BrGlamorousButtonLayoutLook;
		vExact: 25;
		geometry: (BlRoundedRectangleGeometry cornerRadius: 4);
		padding: (BlInsets left: 4 right: 2);
		label: aString;
		icon: BrGlamorousVectorIcons downwards;
		beSmall.
]

{ #category : #accessing }
BrSlideImageExport >> createDropdownFieldFor: aCollection [
	| button dropDownLook |
	button := self createDropdownButtonWithLabel: aCollection first asString.
	dropDownLook := BrGlamorousWithDropdownLook
		handle: [ self createDropdownButtonWithLabel: aCollection first asString ]
		content: [ BrSimpleList new
				items: aCollection;
				stencil: [ :each | 
					| element |
					element := BlElement new.
					element
						viewModel:
							(BrInteractiveModel new
								withHover;
								yourself);
						look:
							(BrInteractiveCommonLook new
								default: [ :f | f background: Color transparent ];
								hovered: [ :f | f background: BrGlamorousColors defaultButtonBorderColor ];
								yourself);
						layout: BlLinearLayout horizontal;
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical fitContent ];
						padding: (BlInsets top: 0 right: 5 bottom: 5 left: 5);
						addEventHandlerOn: BlClickEvent
							do: [ 
								button label: each.
								dropDownLook hide.
								"self applyDescriptor: each" ];
						addChild:
							(BrLabel new
								look: BrGlamorousLabelLook new glamorousRegularFont glamorousCodeSmallSize;
								text: each;
								yourself).
					element ];
				hFitContent;
				vFitContent ].
	button addLook: dropDownLook.
	button
		addLook:
			(BrInteractiveCommonLook new
				default: [ button background: BrGlamorousColors neutralBackgroundColor ];
				hovered: [ button background: BrGlamorousColors neutralBackgroundColor darker ]).
	^ button
]

{ #category : #accessing }
BrSlideImageExport >> createEditableField [
	^ BrEditableLabel new
		look: BrGlamorousEditableLabelLook new glamorousRegularFontAndSize;
		margin: (BlInsets top: 0 right: 5 bottom: 3 left: 0);
		text: ''.
]

{ #category : #accessing }
BrSlideImageExport >> createFormatInputSection [
	| formatLabel |
	formatLabel := self createLabelWithText: 'Format: '.
	formatInputField := self createEditableField
		text: 'JPEG'.
	"formatInputField := self createDropdownFieldFor: formatOptionsCollection."
	
	^ BlElement new
		layout: BlLinearLayout horizontal;
		"padding: (BlInsets top: 10);"
		constraintsDo: [:c |
			c horizontal fitContent.
			c vertical fitContent];
		addChildren: {formatLabel. formatInputField}.
]

{ #category : #accessing }
BrSlideImageExport >> createLabelWithText: aString [
	^ BrLabel new
		look: BrGlamorousLabelLook;
		text: (aString asRopedText
			glamorousRegularFont;
			foreground: Color gray;
			fontSize: 20);
		margin: (BlInsets top: 3 right: 5 bottom: 0 left: 0);
		constraintsDo: [:c |
			c vertical fitContent.
			c horizontal fitContent].
]

{ #category : #accessing }
BrSlideImageExport >> createRangeSection [
	| rangeLabel rangeDropdown |
	rangeLabel := self createLabelWithText: 'Export: '.
	"rangeInputField := self createDropdownFieldFor: exportOptionsCollection."
	rangeInputField := self createEditableField text: 'All' asString.
	
	^ BlElement new
		layout: BlLinearLayout horizontal;
		constraintsDo: [:c |
			c horizontal fitContent.
			c vertical fitContent];
		margin: (BlInsets left: 20);
		addChildren: {rangeLabel. rangeInputField}.
]

{ #category : #accessing }
BrSlideImageExport >> createResolutionSection [
	| resolutionLabel separatorLabel |
	resolutionLabel := self createLabelWithText: 'Resolution: '.
	separatorLabel := self createLabelWithText: 'x'.
	heightInputField := self createEditableField
		text: '1080'.
	widthInputField := self createEditableField
		text: '1920'.
	
	^ BlElement new
		layout: BlLinearLayout horizontal;
		margin: (BlInsets left: 20);
		constraintsDo: [:c |
			c horizontal fitContent.
			c vertical fitContent];
		addChildren: {resolutionLabel. widthInputField. separatorLabel. heightInputField}.
]

{ #category : #accessing }
BrSlideImageExport >> executeAction [ 
	"Execute the receiver's load action"
	| fileName |
	fileName := fileInputField text asString.
	self updateDisplay.
	fileInputField text:''.
	self okAction 
		cull: folder
		cull: fileName.
]

{ #category : #accessing }
BrSlideImageExport >> exportRange [
	^ rangeInputField text asString ifEmpty: [ ^ 'All' asString ].
]

{ #category : #accessing }
BrSlideImageExport >> imageFormat [
	^ formatInputField text asString ifEmpty: [ ^ 'JPEG' asString ].
]

{ #category : #accessing }
BrSlideImageExport >> imageHeight [
	^ heightInputField text asString ifEmpty: [ ^ '1080' asString ].
]

{ #category : #accessing }
BrSlideImageExport >> imageWidth [
	^ widthInputField text asString ifEmpty: [ ^ '1920' asString ]. 
]
