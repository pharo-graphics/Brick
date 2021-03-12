Class {
	#name : #BrDevLookOverview,
	#superclass : #BrVerticalPane,
	#instVars : [
		'lookClass'
	],
	#category : #'Brick-DevTool'
}

{ #category : #'private - instance creation' }
BrDevLookOverview >> buildCategoryLabel: aString [
	^ BrLabel new
		beSmallSize;
		look: (BrGlamorousLabelLook new foreground: (BrGlamorousColors defaultButtonTextColor alpha: 0.5));
		margin: (BlInsets bottom: 5);
		text: aString
]

{ #category : #'private - instance creation' }
BrDevLookOverview >> buildCategoryLabel: aString content: anElement [
	^ BrVerticalPane new
		matchParent;
		addChild: (self buildCategoryLabel: aString);
		addChild: anElement
]

{ #category : #'private - references' }
BrDevLookOverview >> buildCoderArtifactReferenceList: aListOfWishReferences [
	| aList theMethodsAndTheirReference theMethodGroups |
	
	"method -> reference"
	theMethodsAndTheirReference := aListOfWishReferences flatCollect: [ :eachReference | eachReference methods collect: [ :eachMethod | eachMethod -> eachReference ] ].
	
	"dict method -> { (method -> reference) }"
	theMethodGroups := theMethodsAndTheirReference groupedBy: [ :eachAssociation | eachAssociation key ].
	
	"dict method -> { reference }"
	theMethodGroups := theMethodGroups collect: [ :eachAssociation | eachAssociation value collect: [ :each | each value ] as: Set ].

	aList := BrSimpleList new
		matchParent;
		items: theMethodGroups associations;
		stencil: [ :eachReferenceGroup |
			| aHighlighter |
			
			aHighlighter := GtCompositeHighlighter forHighlighters: (eachReferenceGroup value collect: [ :eachReference |
				(GtVariableReferenceHighlighter forVariableName: eachReference artifact name) ]).
			
			(GtPharoMethodCoder forMethod: eachReferenceGroup key)
				highlighter: aHighlighter;
				asElement ].

	^ aList
]

{ #category : #'private - instance creation' }
BrDevLookOverview >> buildEventsList [
	| aList |
	
	aList := BrSimpleList new
		matchParent;
		items: (self lookClass withAllSuperclassEvents);
		itemStencil: [ BrLabel new hMatchParent beSmallSize look: BrGlamorousLabelLook ];
		itemDataBinder: [ :anItemElement :anItem | anItemElement text: anItem name ].

	^ aList
]

{ #category : #'private - section events' }
BrDevLookOverview >> buildEventsSection [
	| aContainer theEvents |
	
	theEvents := self lookClass withAllSuperclassEventReferences.
	theEvents ifEmpty: [ ^ BlElement new size: 0@0 ].

	aContainer := BrVerticalPane new
		hMatchParent;
		vFitContent.

	aContainer addChild: (self buildSectionLabel: 'Events').

	aContainer addChild: (BrEditor new
		look: BrGlamorousEditorLook new;
		padding: (BlInsets all: 3);
		hMatchParent;
		vFitContent;
		beReadOnlyWithSelection;
		text: (self whatIsEvent asRopedText, (String cr, String cr) asRopedText glamorousRegularSmallSize, self lookClass name asRopedText glamorousCodeFont,
			' listens to ' asRopedText glamorousRegularFont,
			(theEvents size asRopedText bold attribute: (self buildExpandArtifctReferencesAttribute: theEvents)),
			' events in:' asRopedText glamorousRegularFont)).
	
	aContainer addChild: (self buildCoderArtifactReferenceList: theEvents).

	^ aContainer
]

{ #category : #'private - references' }
BrDevLookOverview >> buildExpandArtifctReferencesAttribute: theWishes [
	^ BrGlamorousTrangleExpanderTextAttribute new 
		attributesCreatingBlock: [
			BrTextAdornmentDynamicAttribute new 	
				beAppend;
				stencil:  [
					(self buildSmallReferencesList: theWishes)
						addLook: BrShadowLook;
						background: Color white;
						margin: (BlInsets all: 10);
						constraintsDo: [ :c | c textFlow pushLine ] ] ]
]

{ #category : #'private - instance creation' }
BrDevLookOverview >> buildLookHierarchy [
	^ BrSimpleTree new
		matchParent;
		nodeStencil: [ BrLabel new beSmallSize look: BrGlamorousLabelLook ];
		nodeDataBinder: [ :anItemElement :anItem |
			anItemElement text: (anItem rootClass = self lookClass
				ifTrue: [ anItem rootClass name asRopedText bold ]
				ifFalse: [ anItem rootClass name ]) ];
		items: (GtCoderClassesHierarchyTree fromClasses: self lookClass withAllSuperclassAndSubclassLooks) sortByClassName subclassTrees
		children: [ :anItem | anItem subclassTrees ];
		expandAll
]

{ #category : #'private - instance creation' }
BrDevLookOverview >> buildRequestsList [
	| aList |
	
	aList := BrSimpleList new
		matchParent;
		items: (self lookClass withAllSuperclassRequests);
		itemStencil: [ BrLabel new hMatchParent beSmallSize look: BrGlamorousLabelLook ];
		itemDataBinder: [ :anItemElement :anItem | anItemElement text: anItem name ].

	^ aList
]

{ #category : #'private - section requests' }
BrDevLookOverview >> buildRequestsSection [
	| aContainer theRequests |
	
	theRequests := self lookClass withAllSuperclassRequestReferences.
	theRequests ifEmpty: [ ^ BlElement new size: 0@0 ].

	aContainer := BrVerticalPane new
		hMatchParent;
		vFitContent.

	aContainer addChild: (self buildSectionLabel: 'Requests').

	aContainer addChild: (BrEditor new
		look: BrGlamorousEditorLook new;
		padding: (BlInsets all: 3);
		hMatchParent;
		vFitContent;
		beReadOnlyWithSelection;
		text: (self whatIsRequest asRopedText, (String cr, String cr) asRopedText glamorousRegularSmallSize, self lookClass name asRopedText glamorousCodeFont,
			' sends ' asRopedText glamorousRegularFont,
			(theRequests size asRopedText bold attribute: (self buildExpandArtifctReferencesAttribute: theRequests)),
			' requests' asRopedText glamorousRegularFont, ' in:' asRopedText glamorousRegularFont)).
	
	aContainer addChild: (self buildCoderArtifactReferenceList: theRequests).

	^ aContainer
]

{ #category : #'private - instance creation' }
BrDevLookOverview >> buildSectionLabel: aString [
	^ BrLabel new
		beHuge;
		look: BrGlamorousLabelLook;
		margin: (BlInsets top: 15 right: 0 bottom: 0 left: 1);
		text: aString
]

{ #category : #'private - references' }
BrDevLookOverview >> buildSmallReferencesList: aListOfLookArtifactReferences [
	| aList |
	
	aList := BrSimpleList new
		matchParent;
		addEventHandler: (GtPhlowListToSelectHandler new);
		items: aListOfLookArtifactReferences;
		itemStencil: [ BrLabel new
			hMatchParent;
			beSmallSize;
			look: BrGlamorousListLabelLook ];
		itemDataBinder: [ :anItemElement :anItem | anItemElement text: anItem artifact name ].

	^ aList
]

{ #category : #'private - instance creation' }
BrDevLookOverview >> buildWishesList [
	| aList |
	
	aList := BrSimpleList new
		matchParent;
		items: (self lookClass withAllSuperclassWishes);
		itemStencil: [ BrLabel new hMatchParent beSmallSize look: BrGlamorousLabelLook ];
		itemDataBinder: [ :anItemElement :anItem | anItemElement text: anItem name ].

	^ aList
]

{ #category : #'private - section wishes' }
BrDevLookOverview >> buildWishesSection [
	| aContainer theWishes |

	theWishes := self lookClass withAllSuperclassWishReferences.
	theWishes ifEmpty: [ ^ BlElement new size: 0@0 ].

	aContainer := BrVerticalPane new
		hMatchParent;
		vFitContent.

	aContainer addChild: (self buildSectionLabel: 'Wishes').

	aContainer addChild: (BrEditor new
		look: BrGlamorousEditorLook new;
		padding: (BlInsets all: 3);
		hMatchParent;
		vFitContent;
		beReadOnlyWithSelection;
		text: (self whatIsWish  asRopedText, (String cr, String cr) asRopedText glamorousRegularSmallSize, self lookClass name asRopedText glamorousCodeFont,
			' handles ' asRopedText glamorousRegularFont,
			(theWishes size asRopedText bold attribute: (self buildExpandArtifctReferencesAttribute: theWishes)),
			' wishes' asRopedText glamorousRegularFont, ' in:' asRopedText glamorousRegularFont)).
	
	aContainer addChild: (self buildCoderArtifactReferenceList: theWishes).

	^ aContainer
]

{ #category : #initialization }
BrDevLookOverview >> initialize [
	super initialize.
	
	self matchParent.
	self padding: (BlInsets left: 10 right: 10)
]

{ #category : #accessing }
BrDevLookOverview >> lookClass [
	^ lookClass
]

{ #category : #accessing }
BrDevLookOverview >> lookClass: anObject [
	lookClass := anObject.
		
	self addChild: (BrScrollPane new
		look: BrScrollPaneLook + BrGlamorousWithVerticalScrollbarLook;
		content: (BrVerticalPane new
			hMatchParent;
			vFitContent;
			addChildren: { 
				self buildRequestsSection beInSeparateCompositionLayer.
				self buildWishesSection beInSeparateCompositionLayer.
				self buildEventsSection beInSeparateCompositionLayer
			}
		))
]

{ #category : #'private - section events' }
BrDevLookOverview >> whatIsEvent [
	^ ('Typically UI Events that are handled by the Look')
		asRopedText glamorousRegularFont glamorousRegularSmallSize
]

{ #category : #'private - section requests' }
BrDevLookOverview >> whatIsRequest [
	^ ('Request is a special Event sent by the Look to request data from the Widget Model.')
		asRopedText glamorousRegularFont glamorousRegularSmallSize
]

{ #category : #'private - section wishes' }
BrDevLookOverview >> whatIsWish [
	^ ('Wish is a special Event handled by the Look to perform various actions.')
		asRopedText glamorousRegularFont glamorousRegularSmallSize
]
