Class {
	#name : #BrAnchoredExamples,
	#superclass : #BlExamplesTest,
	#category : #'Brick-Examples-Anchored'
}

{ #category : #accessing }
BrAnchoredExamples >> contextMenu [
	<gtExample>
	| handle content container anchor anchorContainer |
	handle := BlElement new
		size: 8 @ 8;
		yourself.
	content := (BrLabel new
		aptitude:
			(BrGlamorousLabelAptitude new
				glamorousRegularFontAndSize;
				yourself);
		padding: (BlInsets all: handle width);
		text: 'look at me!';
		yourself) asScrollableElement
		alignCenter;
		yourself.
	container := BlElement new
		background: Color gray muchLighter;
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				rotateBy: 30;
				translateBy: 400 @ 100;
				scaleBy: 0.5 ];
		yourself.
	anchor := BlElement new
		aptitude: (BrGlamorousWithContextMenuAptitude handle: handle content: content);
		background: Color red;
		size: 40 @ 80;
		addEventHandler: BlPullHandler new;
		yourself.
	anchorContainer := BlElement new
		background: Color red muchLighter;
		relocate: 200 @ 250;
		size: 400 @ 200;
		constraintsDo: [ :c | c ignoreByLayout ];
		clipChildren: false;
		addChild: anchor;
		yourself.
	^ container
		addChild: anchorContainer;
		yourself
]

{ #category : #accessing }
BrAnchoredExamples >> dropdown [
	<gtExample>
	| handle content container anchor anchorContainer |
	handle := BlElement new
		size: 50 @ 50;
		yourself.
	content := (BrLabel new
		aptitude:
			(BrGlamorousLabelAptitude new
				glamorousRegularFontAndSize;
				yourself);
		padding: (BlInsets all: handle width);
		text: 'look at me!';
		yourself) asScrollableElement
		alignCenter;
		yourself.
	container := BlElement new
		background: Color gray muchLighter;
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		transformDo: [ :t | 
			t
				origin: BlAffineTransformationTopLeftOrigin new;
				rotateBy: 30;
				translateBy: 400 @ 100;
				scaleBy: 0.5 ];
		yourself.
	anchor := BlElement new
		aptitude:
			((BrGlamorousWithDropdownAptitude handle: handle content: content)
				root: container;
				yourself);
		background: Color red;
		size: 40 @ 80;
		addEventHandler: BlPullHandler new;
		yourself.
	anchorContainer := BlElement new
		background: Color red muchLighter;
		relocate: 200 @ 250;
		size: 400 @ 200;
		constraintsDo: [ :c | c ignoreByLayout ];
		clipChildren: false;
		addChild: anchor;
		yourself.
	^ container
		addChild: anchorContainer;
		yourself
]

{ #category : #accessing }
BrAnchoredExamples >> tooltip [
	<gtExample>
	| tip |
	tip := BrLabel new
		aptitude: (BrGlamorousLabelAptitude new glamorousRegularFontAndSize);
		padding: (BlInsets all: 20);
		text: 'no transformation affects me!';
		alignCenter.
	^ BlElement new
		aptitude: (BrGlamorousWithTooltipAptitude2 content: tip);
		background: Color red;
		size: 80 @ 100;
		addEventHandler: BlPullHandler new.
]

{ #category : #accessing }
BrAnchoredExamples >> tooltipStaysLevel [
	<gtExample>
	| container anchorContainer |
	container := BlElement new
		background: Color gray muchLighter;
		layout: BlLinearLayout vertical;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		transformDo: [ :t | t 
				origin: BlAffineTransformationTopLeftOrigin new;
				rotateBy: 30;
				translateBy: 500 @ 100;
				scaleBy: 0.5 ].

	anchorContainer := BlElement new
		background: Color paleRed;
		relocate: 100 @ 150;
		size: 400 @ 200;
		constraintsDo: [ :c | c ignoreByLayout ];
		addChild: self tooltip.
	^ container addChild: anchorContainer
]
