Class {
	#name : #BrInteractionExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Interaction'
}

{ #category : #'examples - propagation' }
BrInteractionExamples >> exampleWithPropagation [
	<gtExample>
	| parent expandable child |
	
	parent := BlElement new.
	parent size: 300@300.
	parent background: (Color gray alpha: 0.1).

	parent viewModel: (BrButtonModel new
		action: [ :aWidget | expandable toggle ];
		add: (BrInteractiveModel new addState: (expandable := BrExpandableModel new expand))).

	parent aptitude: (BrInteractiveAptitude new style: [ :aStyle |
		aStyle default: [ :aWidget | aWidget border: BlBorder empty ].
		aStyle expanded: [ :aWidget | aWidget border: (BlBorder paint: Color blue width: 2) ] ]).

	child := BlElement new.
	child size: 100@100.
	child relocate: 50@50.
	child viewModel: (BrInteractiveModel new addState: (BrHoverModel new)).
	child aptitude: (BrInteractiveAptitude new style: [ :aStyle |
		aStyle default: [ :aWidget |
			aWidget
				background: (Color gray alpha: 0.3);
				border: (BlBorder empty) ].
		aStyle expanded: [ :aWidget | aWidget background: (Color blue alpha: 0.3) ].
		aStyle hovered: [ :aWidget | aWidget border: (BlBorder paint: Color red width: 2) ] ]).

	parent addChild: child.

	^ parent
]
