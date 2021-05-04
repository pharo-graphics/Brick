Extension { #name : #BrAnchoredAvailableBounds }

{ #category : #'*Brick-Extensions' }
BrAnchoredAvailableBounds class >> gtAllTypesFor: aView [
	<gtView>
		
	^ aView list
		title: 'All types';
		priority: -10;
		items: [ BrAnchoredAvailableBounds allSubclasses sorted: [ :a :b | a label < b label ] ];
		itemText: [ :each | each label ]
]

{ #category : #'*Brick-Extensions' }
BrAnchoredAvailableBounds class >> gtPreviewFor: aView [
	<gtView>
	
	self = BrAnchoredAvailableBounds
		ifTrue: [ ^ aView empty ].
	
	^ aView forward
		title: 'Preview';
		priority: -10;
		object: [ self asBrAnchoredAvailableBounds ];
		view: #gtPreviewFor:
]

{ #category : #'*Brick-Extensions' }
BrAnchoredAvailableBounds >> gtPreviewFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [
			| theBounds thePoint theAvailableBounds |
			
			theBounds := BlBounds origin: 0@0 extent: 400@300.
			thePoint := theBounds center.
			theAvailableBounds := self in: theBounds from: thePoint.
			
			(BlElement new
				size: 400@300;
				border: (BlBorder builder dashed paint: Color gray; width: 2; build);
				outskirts: BlOutskirts outside;
				addChildren: { 
					BlElement new
						size: 8@8;
						background: (Color gray alpha: 0.3);
						geometry: (BlCircle new);
						relocate: thePoint - (4@4).
					BlElement new
						size: (theAvailableBounds) extent;
						relocate: theAvailableBounds origin;
						background: (Color gray alpha: 0.2);
						border: (BlBorder paint: Color lightGray width: 2);
						layout: BlLinearLayout vertical alignCenter;
						addChild: (BrLabel new
							aptitude: BrGlamorousLabelAptitude new;
							text: self class label)
				}) asScalableElement
					maxScale: 1.2;
					clipChildren: false;
					margin: (BlInsets all: 20)
		]
]
