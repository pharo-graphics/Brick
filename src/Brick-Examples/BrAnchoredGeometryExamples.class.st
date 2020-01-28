Class {
	#name : #BrAnchoredGeometryExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Anchored'
}

{ #category : #'as yet unclassified' }
BrAnchoredGeometryExamples >> movingCorner [
	<gtExample>
	| element small big |
	element := BrAnchoredElement new
		layout: BlFitLayout new;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		in: [ :e | e geometry: (BrAnchoredGeometry cornerRadius: 25 element: e) ];
		addChild:
			(BlElement new
				background: BrGlamorousColors hoveredButtonBorderColor;
				geometry: (BlRectangle cornerRadius: 25);
				border: (BlBorder paint: Color transparent asBlPaint width: 12.5);
				size: 50 @ 50;
				relocate: 0 @ 0;
				yourself);
		addChild:
			(BlElement new
				size: 150 @ 150;
				relocate: 50 @ 50;
				yourself);
		background: Color white;
		border:
			(BlBorder
				paint: BrGlamorousColors defaultButtonBorderColor asBlPaint
				width: 1);
		look: BrShadowLook new;
		yourself.
	small := element children first.
	big := element children second.
	small
		addAnimation:
			(BlSequentialAnimation
				with:
					{(BlTransformAnimation new
						absolute;
						duration: 2 seconds;
						easing: BlEasing linear;
						in: [ :e | 
							e transform
								translateBy: 150 @ 0;
								apply ];
						yourself).
					(BlTransformAnimation new
						absolute;
						duration: 2 seconds;
						easing: BlEasing linear;
						in: [ :e | 
							e transform
								translateBy: 150 @ 150;
								apply ];
						yourself).
					(BlTransformAnimation new
						absolute;
						duration: 2 seconds;
						easing: BlEasing linear;
						in: [ :e | 
							e transform
								translateBy: 0 @ 150;
								apply ];
						yourself).
					(BlTransformAnimation new
						absolute;
						duration: 2 seconds;
						easing: BlEasing linear;
						in: [ :e | 
							e transform
								translateBy: 0 @ 0;
								apply ];
						yourself)}).
	big
		addAnimation:
			(BlSequentialAnimation
				with:
					{(BlTransformAnimation new
						absolute;
						duration: 2 seconds;
						easing: BlEasing linear;
						in: [ :e | 
							e transform
								translateBy: -50 @ 0;
								apply ];
						yourself).
					(BlTransformAnimation new
						absolute;
						duration: 2 seconds;
						easing: BlEasing linear;
						in: [ :e | 
							e transform
								translateBy: -50 @ -50;
								apply ];
						yourself).
					(BlTransformAnimation new
						absolute;
						duration: 2 seconds;
						easing: BlEasing linear;
						in: [ :e | 
							e transform
								translateBy: 0 @ -50;
								apply ];
						yourself).
					(BlTransformAnimation new
						absolute;
						duration: 2 seconds;
						easing: BlEasing linear;
						in: [ :e | 
							e transform
								translateBy: 0 @ 0;
								apply ];
						yourself)}).
	^ element
]

{ #category : #'as yet unclassified' }
BrAnchoredGeometryExamples >> touchingCorners [
	<gtExample>
	^ BrAnchoredElement new
		layout: BlFitLayout new;
		constraintsDo: [ :c | 
			c horizontal fitContent.
			c vertical fitContent ];
		in: [ :e | e geometry: (BrAnchoredGeometry cornerRadius: 20 element: e) ];
		addChild:
			(BlElement new
				background: (Color blue alpha: 0.5);
				size: 50 @ 50;
				relocate: 0 @ 0;
				yourself);
		addChild:
			(BlElement new
				background: (Color red alpha: 0.5);
				size: 150 @ 150;
				relocate: 50 @ 50;
				yourself);
		background: Color gray;
		border: (BlBorder paint: Color black asBlPaint width: 5);
		yourself
]
