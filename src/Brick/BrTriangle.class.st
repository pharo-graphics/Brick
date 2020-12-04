Class {
	#name : #BrTriangle,
	#superclass : #BlElement,
	#traits : 'TBrExpandable + TBrEnableable + TBrDeprecatedSizeAdjustable',
	#classTraits : 'TBrExpandable classTrait + TBrEnableable classTrait + TBrDeprecatedSizeAdjustable classTrait',
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

{ #category : #'api - size adjustable' }
BrTriangle >> beHuge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beHuge)
]

{ #category : #'api - size adjustable' }
BrTriangle >> beLarge [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beLarge)
]

{ #category : #'api - size adjustable' }
BrTriangle >> beMini [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beMini)
]

{ #category : #'api - size adjustable' }
BrTriangle >> beNormal [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beNormal)
]

{ #category : #'api - size adjustable' }
BrTriangle >> beSmall [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beSmall)
]

{ #category : #'api - size adjustable' }
BrTriangle >> beTiny [
	self dispatchEvent: (BrDeprecatedSizeAdjustmentWish beTiny)
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

	buttonModel
		action: [ :aWidget :aButtonModel :anEvent | 
			self toggleExpanded.
			aBlock
				glamourValueWithArgs:
					{aWidget.
					aButtonModel.
					anEvent} ]
]
