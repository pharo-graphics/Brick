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
	model := BrContextMenuModel new
		stencil: [ tooltip ];
		yourself.
	self assert: model visible equals: false.
	self assert: model stencil asElement equals: tooltip.
	^ model
]
