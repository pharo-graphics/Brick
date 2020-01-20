Class {
	#name : #BrProgressExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Progress'
}

{ #category : #support }
BrProgressExamples >> addPlusAndMinuxButtonsIn: aContainer for: aProgressElement [
	<gtExample>
	aContainer 
		addChild: (BrButton new 
			layout: BlLinearLayout horizontal;
			look: BrTextLabelLook; 
			label: 'minus'; 
			action: [ 
				| aPercentage |
				aPercentage := aProgressElement viewModel percentage.
				aPercentage := (aPercentage - 10) max: 0. 
				aProgressElement viewModel percentage: aPercentage ];
			constraintsDo: [ :c | 
				c linear vertical alignCenter.
				c horizontal fitContent.
				c vertical fitContent ]);
		addChild: (BrButton new 
			layout: BlLinearLayout horizontal;
			look: BrTextLabelLook; 
			label: 'plus'; 
			action: [ 
				| aPercentage |
				aPercentage := aProgressElement viewModel percentage.
				aPercentage := (aPercentage + 10) min: 100. 
				aProgressElement viewModel percentage: aPercentage ];
			constraintsDo: [ :c | 
				c linear vertical alignCenter.
				c horizontal fitContent.
				c vertical fitContent ]).
	^ aContainer
]

{ #category : #'examples - basic element' }
BrProgressExamples >> barElement [
	<gtExample>
	^ self element
		background: Color gray;
		geometry: (BlRectangle cornerRadius: 2)
]

{ #category : #'examples - basic element' }
BrProgressExamples >> containerElement [
	<gtExample>
	^ self element
		padding: (BlInsets all: 10);
		margin: (BlInsets all: 10);
		background: Color veryLightGray muchLighter;
		geometry: (BlRectangle cornerRadius: 2)
]

{ #category : #'examples - basic element' }
BrProgressExamples >> element [
	<gtExample>
	^ BlElement new
]

{ #category : #'examples - exact with text' }
BrProgressExamples >> exactProgress [
	<gtExample>
	| aProgress |
	aProgress := self progress.
	aProgress percentage: 30.
	self assert: aProgress percentage equals: 30.
	^ aProgress
]

{ #category : #'examples - exact with text' }
BrProgressExamples >> exactProgressWithBarAndLabelLook [
	<gtExample>
	| aProgress aLabelLook |
	aProgress := self exactProgressWithBarLook.
	aLabelLook := BrTextLabelLook new foreground: Color white.
	aLabelLook labelDo: [ :aWidget | 
		aWidget constraintsDo: [ :c | 
			c frame horizontal alignCenter.
			c frame vertical alignCenter ] ].
	aProgress 
		addLook: (BrProgressWithLabelLook new pattern: 'Out of {2}%, {1}% transfered');
		addLook: aLabelLook.
	self assert: aProgress childrenCount equals: 2.
	"self assert: aLabelLook text asString equals: 'Out of 100%, 30% transfered'.
	self assert: aLabelLook label text asString equals: 'Out of 100%, 30% transfered'."
	^ aProgress
]

{ #category : #'examples - exact with text' }
BrProgressExamples >> exactProgressWithBarLook [
	<gtExample>
	| aProgress |
	aProgress := self exactProgress.
	aProgress 
		look: BrProgressWithBarLook;
		geometry: (BlRectangle cornerRadius: 10);
		background: Color blue muchLighter;
		constraintsDo: [ :c | 
			c padding: (BlInsets all: 3).
			c horizontal matchParent.
			c vertical exact: 20 ].
	aProgress barDo: [ :anElement | 
		anElement 
			background: Color blue;
			geometry: (BlRectangle cornerRadius: 8);
			constraintsDo: [ :c |
				c horizontal matchParent.
				c vertical matchParent. ] ].
	self assert: aProgress percentage equals: 30.
	self assert: aProgress childrenCount equals: 1.
	^ aProgress
]

{ #category : #'examples - basic widget' }
BrProgressExamples >> progress [
	<gtExample>
	| aProgress |
	aProgress := BrProgress new.
	self assert: aProgress viewModel isNotNil.
	self assert: aProgress childrenCount equals: 0.
	self assert: aProgress percentage equals: 0.
	self assert: aProgress amount equals: 0.
	self assert: aProgress total equals: 100.
	self assert: aProgress percentage equals: 0.
	self assert: aProgress fraction equals: 0.
	^ aProgress
]

{ #category : #'examples - basic element' }
BrProgressExamples >> progressElement [
	<gtExample>
	| aContainer aBarElement |
	aBarElement := self barElement.
	aContainer := self containerElement.
	aContainer 
		constraintsDo: [ :c |
			c horizontal matchParent.
			c vertical exact: 30. ];
		addChild: aBarElement as: BrProgressLook widgetProgressName.
	aContainer viewModel: self progressModel.
	aContainer look: BrProgressWithBarLook.
	^ aContainer
]

{ #category : #'examples - basic element' }
BrProgressExamples >> progressElementWithPlusAndMinusButtons [
	<gtExample>
	| aContainer aProgressElement |
	aContainer := self containerElement.
	aProgressElement := self progressElement.
	aContainer 
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 72 ];
		background: Color transparent;
		addChild: aProgressElement.
	self addPlusAndMinuxButtonsIn: aContainer for: aProgressElement.
	^ aContainer
]

{ #category : #'examples - model' }
BrProgressExamples >> progressModel [
	<gtExample>
	| aModel |
	aModel := BrProgressModel new.
	self assert: aModel percentage isZero.
	self assert: aModel amount equals: 0.
	self assert: aModel total equals: 100.
	^ aModel
]

{ #category : #'examples - basic element' }
BrProgressExamples >> rootContainerElement [
	<gtExample>
	^ self containerElement
		layout: BlLinearLayout horizontal;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ];
		background: Color transparent
]
