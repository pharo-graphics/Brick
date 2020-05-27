Class {
	#name : #BrTriangle,
	#superclass : #BlElement,
	#traits : 'TBrExpandable + TBrEnableable + TBrSizeAdjustable',
	#classTraits : 'TBrExpandable classTrait + TBrEnableable classTrait + TBrSizeAdjustable classTrait',
	#instVars : [
		'buttonModel'
	],
	#category : #'Brick-Triangle - UI'
}

{ #category : #'api - actions' }
BrTriangle >> action: aBlock [
	"do no handle expand and collapse actions"
	buttonModel action: aBlock
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
	self viewModel: (buttonModel := BrButtonModel new 
		action: [ self toggle ];
		add: (BrInteractiveModel new
				addStates: {
					BrExpandableModel new. BrEnablementModel new.
					BrSizeAdjustmentModel new.
					BrHoverModel new. BrPressModel new. }))
]

{ #category : #'api - visibility' }
BrTriangle >> show [
	self visibility: BlVisibility visible
]

{ #category : #'api - actions' }
BrTriangle >> toggleAction: aBlock [
	"toggle triangle and then evaluate the block"
	buttonModel action: [ :aWidget :aButtonModel :anEvent |
		self toggle.
		aBlock glamourValueWithArgs: { aWidget. aButtonModel. anEvent }. ].
]
