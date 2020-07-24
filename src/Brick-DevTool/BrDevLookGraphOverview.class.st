Class {
	#name : #BrDevLookGraphOverview,
	#superclass : #BrVerticalPane,
	#instVars : [
		'lookClass'
	],
	#category : #'Brick-DevTool'
}

{ #category : #'private - instance creation' }
BrDevLookGraphOverview >> buildLookAndModelGraph [
	| aMondrian |
	
	aMondrian := GtMondrian new.
	
	aMondrian nodes 
		stencil: [ :eachClass |self buildNodeForClass: eachClass ];
		with: { self lookClass };
		forEach: [ :eachLookClass |
			aMondrian nodes 
				stencil: [ :eachRequestClass |
					BrLabel new
						beTiny;
						look: BrGlamorousLabelLook new;
						text: eachRequestClass value name ];
				with: ((eachLookClass withAllSuperclassRequests sorted: [ :a :b | a name < b name ]) collect: [ :aRequest | #look -> aRequest ]).
				
			aMondrian layout explicit: BlLinearLayout vertical
		] in: #requests;
		forEach: [ :eachLookClass |
			aMondrian nodes 
				stencil: [ :eachRequestClass |
					BrLabel new
						beTiny;
						look: BrGlamorousLabelLook new;
						text: eachRequestClass value name ];
				with: ((eachLookClass withAllSuperclassChangeEvents sorted: [ :a :b | a name < b name ]) collect: [ :aChangeEvent | #look -> aChangeEvent ]).
			
			aMondrian layout explicit: BlLinearLayout vertical
		] in: #changeEvents.
	
	aMondrian nodes 
		stencil: [ :eachClass | self buildNodeForClass: eachClass ];
		with: self lookClass allRelatedViewModels;
		forEach: [ :eachModelClass |
			aMondrian nodes 
				stencil: [ :eachRequestClass |
					BrLabel new
						beTiny;
						look: BrGlamorousLabelLook new;
						text: eachRequestClass value name ];
				with: ((eachModelClass withAllSuperclassRequests sorted: [ :a :b | a name < b name ]) collect: [ :aRequest | #model -> aRequest ]).
				
			aMondrian layout explicit: BlLinearLayout vertical
		] in: #requests;
			
		forEach: [ :eachModelClass |	
			aMondrian nodes 
				stencil: [ :eachRequestClass |
					BrLabel new
						beTiny;
						look: BrGlamorousLabelLook new;
						text: eachRequestClass value name ];
				with: ((eachModelClass withAllSuperclassChangeEvents sorted: [ :a :b | a name < b name ]) collect: [ :aChangeEvent | #model -> aChangeEvent ]).
			aMondrian layout explicit: BlLinearLayout vertical.
		]  in: #changeEvents;
		
		forEach: [ :eachModelClass |
			aMondrian edges
				passive;
				fromRightCenter;
				toRightCenter;
				stencil: [ :x |
					BlParabollaArcElement new
						border: (BlBorder paint: (Color blue alpha: 0.5) width: 2);
						toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: (Color blue alpha: 0.5) width: 2)) ];
				connect: (eachModelClass withAllSuperclassRequests collect: [ :eachRequest | eachRequest -> eachRequest new responseClass ])
					from: [ :each | #model -> each key ]
					to: [ :each | #model -> each value ].
					
			aMondrian layout explicit: BlLinearLayout vertical ] in: #default.
				
	aMondrian layout explicit: BlLinearLayout vertical.

	aMondrian edges
		stencil: [ :each | BlLineElement new border: BlBorder empty ];
		connectToAll: #allRelatedViewModels.
		
	aMondrian edges
		passive;
		fromRightCenter;
		toLeftCenter;
		stencil: [ :x |
			BlSigmoidElement new
				beHorizontal;
				border: (BlBorder paint: (Color red alpha: 0.5) width: 2);
				toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: (Color red alpha: 0.5) width: 2)) ];
		connect: self lookClass withAllSuperclassRequests
			from: [ :eachRequest | #look -> eachRequest ]
			to: [ :eachRequest | #model -> eachRequest ].

	aMondrian edges
		passive;
		fromLeftCenter;
		toRightCenter;
		stencil: [ :x |
			BlSigmoidElement new
				beHorizontal;
				border: (BlBorder paint: (Color blue alpha: 0.5) width: 2);
				toHead: (BlArrowheadSimpleArrow new border: (BlBorder paint: (Color blue alpha: 0.5) width: 2)) ];
		connect: self lookClass withAllSuperclassChangeEvents
			from: [ :eachEvent | #model  -> eachEvent ]
			to: [ :eachEvent | #look -> eachEvent ].

	aMondrian layout horizontalTree levelDistance: 50; nodeDistance: 50.

	^ aMondrian root clipChildren: false
]

{ #category : #'private - instance creation' }
BrDevLookGraphOverview >> buildNodeForClass: aLookClass [
	| aContainer |
	
	aContainer := BrVerticalPane new
		clipChildren: false;
		padding: (BlInsets all: 5);
		in: [ :anElement | anElement graph beChildrenContainer: #default ];
		fitContent.

	aContainer addChild: (BrLabel new
		beSmall;
		look: BrGlamorousLabelLook new bold;
		text: aLookClass name).
		
	aContainer addChild: (BrVerticalPane new
		margin: (BlInsets top: 10);
		in: [ :anElement | anElement graph beChildrenContainer: #requests ];
		fitContent;
		addChild: (BrLabel new
			beSmall;
			look: (BrGlamorousLabelLook new foreground: Color gray);
			text: 'Requests')
	) as: #requests.
	
	aContainer addChild: (BrVerticalPane new
		margin: (BlInsets top: 10);
		in: [ :anElement | anElement graph beChildrenContainer: #changeEvents ];
		fitContent;
		addChild: (BrLabel new
			beSmall;
			look: (BrGlamorousLabelLook new foreground: Color gray);
			text: 'Change events')
	) as: #changeEvents.

	^ BrVerticalPane new
		fitContent;
		clipChildren: false;
		addLook: BrShadowLook;
		background: Color white;
		addChild: aContainer
]

{ #category : #initialization }
BrDevLookGraphOverview >> initialize [
	super initialize.
	
	self matchParent
]

{ #category : #accessing }
BrDevLookGraphOverview >> lookClass [
	^ lookClass
]

{ #category : #accessing }
BrDevLookGraphOverview >> lookClass: anObject [
	lookClass := anObject.

	self addChild: (BrVerticalPane new matchParent addChild: self buildLookAndModelGraph asPannableElement).
]
