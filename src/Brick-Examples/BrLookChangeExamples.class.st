Class {
	#name : #BrLookChangeExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Look'
}

{ #category : #buttons }
BrLookChangeExamples >> buttonLookChange [
	<gtExample>
	^ BrButton new
		look: BrMaterialButtonLook;
		label: 'I am quite materialistic...';
		action: [ :e | 
			(e look isKindOf: BrMaterialButtonLook)
				ifTrue: [ e
						look: BrGlamorousButtonWithLabelLook;
						label: 'Now I am glamorous!' ]
				ifFalse: [ e
						look: BrMaterialButtonLook;
						label: 'I am quite materialistic...' ] ]
]

{ #category : #buttons }
BrLookChangeExamples >> buttonLookPropertyChange [
	<gtExample>
	| blue wide notSoWide fat pointy round roundish changes label |
	blue := #(widget background)
		asBrLookPropertyChangeWithValue: BrGlamorousColors hoveredButtonTextColor asBlBackground.
	wide := #(widget width) asBrLookPropertyChangeWithValue: 500.
	notSoWide := #(widget width) asBrLookPropertyChangeWithValue: 350.
	fat := #(widget padding)
		asBrLookPropertyChangeWithValue: (BlInsets all: 50).
	pointy := #(widget geometry)
		asBrLookPropertyChangeWithValue: BlRectangle new.
	round := #(widget geometry)
		asBrLookPropertyChangeWithValue: BlEllipse new.
	roundish := #(widget geometry)
		asBrLookPropertyChangeWithValue: (BlRectangle cornerRadius: 10).
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
		geometry: (BlRectangle cornerRadius: 20);
		look: BrGlamorousLabelLook;
		text: 'Click me to change!' asRopedText;
		yourself.
	label
		addEventHandlerOn: BlClickEvent
		do: [ | random look text |
			random := changes shuffled
				copyFrom: 1
				to: (0 to: changes size) atRandom.
			look := BrLook new.
			text := ' '
				join:
					(random
						collect: [ :f | 
							look changes add: f value.
							f key ]).
			label look: BrGlamorousLabelLook + look.
			label text: text asRopedText ].
	^ label
]
