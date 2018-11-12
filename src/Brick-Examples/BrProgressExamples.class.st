Class {
	#name : #BrProgressExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Progress'
}

{ #category : #element }
BrProgressExamples >> bar [
	<gtExample>
	^ self element
		background: (Color fromHexString: #BDBDBD);
		geometry: (BlRectangle cornerRadius: 2)
]

{ #category : #element }
BrProgressExamples >> container [
	<gtExample>
	^ self element
		padding: (BlInsets all: 0);
		margin: (BlInsets all: 10);
		background: Color blue;
		geometry: (BlRectangle cornerRadius: 2)
]

{ #category : #element }
BrProgressExamples >> element [
	<gtExample>
	^ BlElement new
]

{ #category : #element }
BrProgressExamples >> example [
	<gtExample>
	| aContainer aProgressElement aPercentage |
	aContainer := self container.
	aProgressElement := self progress.
	aPercentage := aProgressElement viewModel percentage.
	aContainer 
		look: BrLayoutLook linearHorizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent ];
		background: Color transparent;
		addChild: aProgressElement;
		addChild: (BrButton new 
			look: BrTextLabelLook; 
			label: 'minus'; 
			action: [ 
				aPercentage := (aPercentage - 10) max: 0. 
				aProgressElement viewModel percentage: aPercentage ]);
		addChild: (BrButton new 
			look: BrTextLabelLook; 
			label: 'plus'; 
			action: [ 
				aPercentage := (aPercentage + 10) min: 100. 
				aProgressElement viewModel percentage: aPercentage ]).
	^ aContainer
]

{ #category : #element }
BrProgressExamples >> progress [
	<gtExample>
	| aContainer aBarElement |
	aBarElement := self bar.
	aContainer := self container.
	aContainer 
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical exact: 30. ];
		addChild: aBarElement as: BrProgressLook widgetProgressName.
	aContainer viewModel: self progressModel.
	aContainer look: BrProgressLook.
	^ aContainer
]

{ #category : #model }
BrProgressExamples >> progressModel [
	<gtExample>
	^ BrProgressModel new
]
