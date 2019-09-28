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
	| model tooltip |
	tooltip := BlElement new
		background: Color blue;
		yourself.
	model := BrWithContextMenuModel new
		stencil: [ tooltip ];
		yourself.
	self assert: model visible equals: false.
	self assert: model stencil asElement equals: tooltip.
	^ model
]

{ #category : #'as yet unclassified' }
BrContextMenuExamples >> modelForElement: anElement [
	| model tooltip |
	tooltip := BrSimpleList new
		stencil: [ :e | 
			BrLabel new
				look: BrGlamorousLabelLook;
				text: e key;
				addEventHandlerOn: BlMouseEnterEvent
					do: [ :f | f target background: BrGlamorousColors defaultButtonBorderColor ];
				addEventHandlerOn: BlMouseLeaveEvent
					do: [ :f | f target background: Color transparent ];
				addEventHandlerOn: BlClickEvent do: e value;
				padding: (BlInsets all: 5);
				hMatchParent;
				vFitContent;
				yourself ];
		display:
			{('Change to blue' -> [ anElement background: Color blue ]).
			('Change to red' -> [ anElement background: Color red ]).
			('Change to green' -> [ anElement background: Color green ])};
		hFitContent;
		vFitContent;
		yourself.
	model := BrWithContextMenuModel new
		stencil: [ BlElement new
				look:
					(BrGlamorousContextMenuLook new
						content: tooltip;
						yourself) ];
		yourself.
	self assert: model visible equals: false.
	self assert: model stencil asElement look content equals: tooltip.
	^ model
]
