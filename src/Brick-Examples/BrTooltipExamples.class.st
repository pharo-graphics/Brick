Class {
	#name : #BrTooltipExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Tooltip'
}

{ #category : #accessing }
BrTooltipExamples >> element [
	<gtExample>
	^ BlElement new
		background: Color red;
		yourself
]

{ #category : #accessing }
BrTooltipExamples >> elementWithModelAndLook [
	<gtExample>
	| element model look |
	element := self element.
	model := self model.
	look := self look.
	element
		viewModel:
			model
				+
					(BrInteractiveModel new
						addState: BrHoverModel new;
						yourself).
	element look: look.
	self assert: look stencil equals: model stencil.
	^ element
]

{ #category : #accessing }
BrTooltipExamples >> look [
	<gtExample>
	| look |
	look := BrWithTooltipLook new.
	self assert: look visible equals: false.
	self assert: (look stencil asElement isKindOf: BlElement).
	^ look
]

{ #category : #'as yet unclassified' }
BrTooltipExamples >> model [
	<gtExample>
	| model tooltip |
	tooltip := BlElement new
		background: Color blue;
		yourself.
	model := BrTooltipModel new
		stencil: [ tooltip ];
		yourself.
	self assert: model visible equals: false.
	self assert: model stencil asElement equals: tooltip.
	^ model
]
