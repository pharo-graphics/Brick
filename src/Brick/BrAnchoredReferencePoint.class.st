Class {
	#name : #BrAnchoredReferencePoint,
	#superclass : #Object,
	#category : #'Brick-Anchored - Support'
}

{ #category : #converting }
BrAnchoredReferencePoint class >> asBrAnchoredReferencePoint [
	^ self new
]

{ #category : #'gt-extension' }
BrAnchoredReferencePoint class >> gtAllTypesFor: aView [
	<gtView>
		
	^ aView list
		title: 'All types';
		priority: -10;
		items: [ BrAnchoredReferencePoint allSubclasses sorted: [ :a :b | a label < b label ] ];
		itemText: [ :each | each label ]
]

{ #category : #'gt-extension' }
BrAnchoredReferencePoint class >> gtPreviewFor: aView [
	<gtView>
	
	self = BrAnchoredReferencePoint
		ifTrue: [ ^ aView empty ].
	
	^ aView forward
		title: 'Preview';
		priority: -10;
		object: [ self asBrAnchoredReferencePoint ];
		view: #gtPreviewFor:
]

{ #category : #accessing }
BrAnchoredReferencePoint class >> label [
	^ self subclassResponsibility
]

{ #category : #converting }
BrAnchoredReferencePoint >> asBrAnchoredReferencePoint [
	^ self
]

{ #category : #'as yet unclassified' }
BrAnchoredReferencePoint >> from: aBounds [
	self subclassResponsibility
]

{ #category : #'gt-extension' }
BrAnchoredReferencePoint >> gtPreviewFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Preview';
		priority: 1;
		stencil: [
			| theBounds thePoint |
			
			theBounds := BlBounds origin: 0@0 extent: 400@300.
			thePoint := self from: (theBounds copy expandBy: (4@4) negated).
			
			(BlElement new
				size: theBounds extent;
				border: (BlBorder builder dashed paint: Color gray; width: 2; build);
				outskirts: BlOutskirts outside;
				clipChildren: false;
				addChildren: { 
					BlElement new
						size: 8@8;
						background: (Color gray alpha: 0.3);
						geometry: (BlCircle new);
						relocate: thePoint - (4@4);
						clipChildren: false;
						layout: BlLinearLayout vertical alignCenter;
						addChild: (BrLabel new
							look: (BrGlamorousLabelLook new fontSize: 9);
							text: self class label).
				}) asScalableElement
					maxScale: 1.2;
					clipChildren: false;
					margin: (BlInsets all: 20)
		]
]
