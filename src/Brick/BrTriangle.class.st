Class {
	#name : #BrTriangle,
	#superclass : #BlElement,
	#instVars : [
		'buttonModel',
		'interactiveModel',
		'enablementModel',
		'expandableModel'
	],
	#category : #'Brick-Triangle - UI'
}

{ #category : #'api - actions' }
BrTriangle >> action: aBlock [
	"do no handle expand and collapse actions"
	buttonModel action: aBlock
]

{ #category : #'api - expandable' }
BrTriangle >> collapse [
	expandableModel collapse
]

{ #category : #'api - activation' }
BrTriangle >> disable [
	enablementModel disable
]

{ #category : #'api - activation' }
BrTriangle >> disabled: aBoolean [
	enablementModel disabled: aBoolean.
]

{ #category : #'api - activation' }
BrTriangle >> enable [
	enablementModel enable
]

{ #category : #'api - expandable' }
BrTriangle >> expand [
	expandableModel expand
]

{ #category : #'api - visibility' }
BrTriangle >> hide [
	self visibility: BlVisibility hidden
]

{ #category : #'api - visibility' }
BrTriangle >> hide: aBoolean [
	aBoolean 
		ifTrue: [ self hide ] 
		ifFalse: [ self show ]
]

{ #category : #initialization }
BrTriangle >> initialize [
	super initialize.
	self viewModel: (BrWidgetModel new
		addAll: {
			(buttonModel := BrButtonModel new action: [ self toggle ]).
			(interactiveModel := BrInteractiveModel new
				addStates: {BrHoverModel new. BrPressModel new}).
			(enablementModel := BrEnablementModel new).
			(expandableModel := BrExpandableModel new)})
]

{ #category : #'api - testing' }
BrTriangle >> isCollapsed [
	^ expandableModel isCollapsed
]

{ #category : #'api - testing' }
BrTriangle >> isExpanded [
	^ expandableModel isExpanded
]

{ #category : #'api - visibility' }
BrTriangle >> show [
	self visibility: BlVisibility visible
]

{ #category : #'api - expandable' }
BrTriangle >> toggle [
	expandableModel toggle
]

{ #category : #'api - actions' }
BrTriangle >> toggleAction: aBlock [
	"toggle triangle and then evaluate the block"
	buttonModel action: [ :aWidget :aButtonModel :anEvent |
		self toggle.
		aBlock glamourValueWithArgs: { aWidget. aButtonModel. anEvent }. ].
]
