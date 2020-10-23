"
I am a copy of class BrAnchoredPosition. This comment is copied from there, and might not be entirely accurate

Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design:

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	block:		<Object>


    Implementation Points
"
Class {
	#name : #BrAnchoredAvailableBounds,
	#superclass : #Object,
	#category : #'Brick-Anchored - Support'
}

{ #category : #converting }
BrAnchoredAvailableBounds class >> asBrAnchoredAvailableBounds [
	^ self new
]

{ #category : #'gt-extension' }
BrAnchoredAvailableBounds class >> gtAllTypesFor: aView [
	<gtView>
		
	^ aView list
		title: 'All types';
		priority: -10;
		items: [ BrAnchoredAvailableBounds allSubclasses sorted: [ :a :b | a label < b label ] ];
		itemText: [ :each | each label ]
]

{ #category : #'gt-extension' }
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

{ #category : #accessing }
BrAnchoredAvailableBounds class >> label [
	^ self subclassResponsibility
]

{ #category : #converting }
BrAnchoredAvailableBounds >> asBrAnchoredAvailableBounds [
	^ self
]

{ #category : #'gt-extension' }
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
							look: BrGlamorousLabelLook new;
							text: self class label)
				}) asScalableElement
					maxScale: 1.2;
					clipChildren: false;
					margin: (BlInsets all: 20)
		]
]

{ #category : #'as yet unclassified' }
BrAnchoredAvailableBounds >> in: aBounds from: aPoint [
	self subclassResponsibility
]
