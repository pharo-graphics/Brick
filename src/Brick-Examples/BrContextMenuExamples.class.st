Class {
	#name : #BrContextMenuExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Context Menu'
}

{ #category : #accessing }
BrContextMenuExamples >> aptitude [
	<gtExample>
	| look |
	look := BrWithContextMenuAptitude new.
	self assert: look visible equals: false.
	self assert: (look stencil asStencil asElement isKindOf: BlElement).
	^ look
]

{ #category : #accessing }
BrContextMenuExamples >> compact [
	<gtExample>
	| element |
	element := self element.
	element aptitude:
		(BrGlamorousWithContextMenuAptitude
			content: [
				BrGlamorousSimpleContextMenuContent new
					items:
						{('Change to blue' -> [ :e | e background: Color blue ]).
						('Change to red' -> [ :e | e background: Color red ]).
						('Change to green' -> [ :e | e background: Color green ])};
					yourself ]);
		yourself.
	^ element
]

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
	look := self aptitude.
	element viewModel: model.
	element aptitude: look.
	self assert: look stencil equals: model stencil.
	^ element
]

{ #category : #accessing }
BrContextMenuExamples >> elementWithModelAndLook [
	<gtExample>
	| element model look |
	element := self element.
	model := self model.
	look := self aptitude.
	element viewModel: model.
	element aptitude: look.
	self assert: look stencil equals: model stencil.
	^ element
]

{ #category : #accessing }
BrContextMenuExamples >> model [
	<gtExample>
	| model |
	model := BrWithContextMenuModel new
		stencil: [ BrAnchoredElement new
				aptitude:
					(BrContextMenuAptitude new
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
				yourself ];
		yourself.
	self assert: model visible equals: false.
	self assert: (model stencil asStencil asElement isKindOf: BlElement).
	^ model
]

{ #category : #accessing }
BrContextMenuExamples >> modelForElement: anElement [
	| model |
	model := BrWithContextMenuModel new
		stencil: [ BrAnchoredElement new
				aptitude:
					(BrGlamorousContextMenuAptitude new
						content:
							(BrGlamorousSimpleContextMenuContent new
								display:
									{('Change to blue' -> [ :e | e background: Color blue ]).
									('Change to red' -> [ :e | e background: Color red ]).
									('Change to green' -> [ :e | e background: Color green ])};
								yourself);
						yourself);
				yourself ];
		yourself.
	self assert: model visible equals: false.
	^ model
]
