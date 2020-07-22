Class {
	#name : #BrAnchoredExamples,
	#superclass : #Object,
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
		look:
			(BrGlamorousLabelLook new
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
		look: (BrGlamorousWithContextMenuLook handle: handle content: content);
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
		look:
			(BrGlamorousLabelLook new
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
		look:
			((BrGlamorousWithDropdownLook2 handle: handle content: content)
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
	| content container anchor anchorContainer |
	content := BrLabel new
		look: (BrGlamorousLabelLook new glamorousRegularFontAndSize);
		padding: (BlInsets all: 20);
		text: 'no transformation affects me!';
		alignCenter.
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
	anchor := BlElement new
		look: (BrGlamorousWithTooltipLook2 content: content);
		background: Color red;
		size: 80 @ 100;
		addEventHandler: BlPullHandler new.
	anchorContainer := BlElement new
		background: Color paleRed;
		relocate: 100 @ 150;
		size: 400 @ 200;
		constraintsDo: [ :c | c ignoreByLayout ];
		addChild: anchor.
	^ container addChild: anchorContainer
]
