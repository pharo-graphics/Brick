Class {
	#name : #BrScrollPaneExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Scrollpane'
}

{ #category : #'instance creation' }
BrScrollPaneExamples >> content [
	<gtExample>
	
	^ BrVerticalPane new
		vFitContent;
		hMatchParent;
		cellSpacing: 5;
		padding: (BlInsets right: 10);
		addChildren: (20 timesCollect: [ :i |
			BlElement new
				background: (BlColorTransition interpolate: (BrGlamorousColors primaryBorderColor alpha: 0.5) to: Color yellow at: (i / 50.0));
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical exact: 10 + (i * 5) ] ])
]

{ #category : #'examples - scrollpane' }
BrScrollPaneExamples >> scrollpaneWithContentAndScrollbar [
	<gtExample>
	
	^ BrScrollPane new
		look: BrScrollPaneLook + BrGlamorousWithVerticalScrollbarLook;
		content: self content
]

{ #category : #'examples - scrollpane' }
BrScrollPaneExamples >> scrollpaneWithContentWithoutScrollbar [
	<gtExample>

	^ BrScrollPane new
		look: BrScrollPaneLook;
		content: self content
]
