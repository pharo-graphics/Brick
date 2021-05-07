Class {
	#name : #BrLookChangeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Look'
}

{ #category : #buttons }
BrLookChangeExamples >> buttonLookChange [
	<gtExample>
	^ BrButton new
		aptitude: BrMaterialButtonAptitude;
		label: 'I am quite materialistic...';
		action: [ :e | 
			(e aptitude isKindOf: BrMaterialButtonAptitude)
				ifTrue: [ e
						aptitude: BrGlamorousButtonWithLabelAptitude;
						label: 'Now I am glamorous!' ]
				ifFalse: [ e
						aptitude: BrMaterialButtonAptitude;
						label: 'I am quite materialistic...' ] ]
]

{ #category : #buttons }
BrLookChangeExamples >> buttonLookPropertyChange [
	<gtExample>
	| blue wide notSoWide fat pointy round roundish changes label |
	blue := BrLookPropertyChange new
		path: #(widget background);
		value: [ BrGlamorousColors hoveredButtonTextColor asBlBackground ];
		yourself.
	wide := BrLookPropertyChange new
		path: #(widget width);
		value: [ 500 ];
		yourself.
	notSoWide := BrLookPropertyChange new
		path: #(widget width);
		value: [ 350 ];
		yourself.
	fat := BrLookPropertyChange new
		path: #(widget padding);
		value: [ BlInsets all: 50 ];
		yourself.
	pointy := BrLookPropertyChange new
		path: #(widget geometry);
		value: [ BlRoundedRectangleGeometry new ];
		yourself.
	round := BrLookPropertyChange new
		path: #(widget geometry);
		value: [ BlEllipseGeometry new ];
		yourself.
	roundish := BrLookPropertyChange new
		path: #(widget geometry);
		value: [ BlRoundedRectangleGeometry cornerRadius: 10 ];
		yourself.
	changes := {(#blue -> blue).
	(#wide -> wide).
	(#notSoWide -> notSoWide).
	(#fat -> fat).
	(#pointy -> pointy).
	(#round -> round).
	(#roundish -> roundish)}.
	label := BrLabel new
		border: (BlBorder paint: Color black width: 1);
		padding: (BlInsets all: 25);
		geometry: (BlRoundedRectangleGeometry cornerRadius: 20);
		aptitude: BrGlamorousLabelAptitude;
		text: 'Click me to change!' asRopedText;
		yourself.
	label
		addEventHandlerOn: BlClickEvent
		do: [ | random look text |
			random := changes shuffled
				copyFrom: 1
				to: (0 to: changes size) atRandom.
			look := BrAptitude new.
			text := ' '
				join:
					(random
						collect: [ :f | 
							look changes add: f value.
							f key ]).
			label aptitude: BrGlamorousLabelAptitude + look.
			label text: text asRopedText ].
	^ label
]
