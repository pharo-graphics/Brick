Class {
	#name : #BrContextMenuExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Context Menu'
}

{ #category : #accessing }
BrContextMenuExamples >> element [
	<gtExample>
	^ BlElement new
		background: Color red;
		yourself
]

{ #category : #accessing }
BrContextMenuExamples >> elementWithContextMenuModelAndLook [
	<gtExample>
	| element model look |
	element := self element.
	model := self modelForElement: element.
	look := self look.
	element viewModel: model.
	element look: look.
	self assert: look stencil equals: model stencil.
	^ element
]

{ #category : #accessing }
BrContextMenuExamples >> elementWithModelAndLook [
	<gtExample>
	| element model look |
	element := self element.
	model := self model.
	look := self look.
	element viewModel: model.
	element look: look.
	self assert: look stencil equals: model stencil.
	^ element
]

{ #category : #accessing }
BrContextMenuExamples >> look [
	<gtExample>
	| look |
	look := BrWithContextMenuLook new.
	self assert: look visible equals: false.
	self assert: (look stencil asElement isKindOf: BlElement).
	^ look
]

{ #category : #'as yet unclassified' }
BrContextMenuExamples >> model [
	<gtExample>
	| model content |
	content := BlElement new
		look:
			(BrContextMenuLook new
				handle:
					(BlElement new
						size: 10 @ 10;
						padding: (BlInsets all: 5);
						background: Color yellow;
						yourself);
				content:
					(BlElement new
						background: Color green;
						yourself);
				yourself);
		background: Color blue;
		yourself.
	model := BrWithContextMenuModel new
		stencil: [ content ];
		yourself.
	self assert: model visible equals: false.
	self assert: model stencil asElement equals: content.
	^ model
]

{ #category : #'as yet unclassified' }
BrContextMenuExamples >> modelForElement: anElement [
	| model content |
	content := BrGlamorousSimpleContextMenuContent new
		display:
			{('Change to blue' -> [ anElement background: Color blue ]).
			('Change to red' -> [ anElement background: Color red ]).
			('Change to green' -> [ anElement background: Color green ])};
		yourself.
	model := BrWithContextMenuModel new
		stencil: [ BlElement new
				look:
					(BrGlamorousContextMenuLook new
						content: content;
						yourself);
				yourself ];
		yourself.
	self assert: model visible equals: false.
	self assert: model stencil asElement look content equals: content.
	^ model
]
