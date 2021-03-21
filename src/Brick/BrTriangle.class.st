Class {
	#name : #BrTriangle,
	#superclass : #BlElement,
	#traits : 'TBrExpandable + TBrEnableable + TBrSizeAdjustable',
	#classTraits : 'TBrExpandable classTrait + TBrEnableable classTrait + TBrSizeAdjustable classTrait',
	#category : #'Brick-Triangle - UI'
}

{ #category : #'api - actions' }
BrTriangle >> action: aBlock [
	"do no handle expand and collapse actions"
	self viewModel action: aBlock
]

{ #category : #'api - expandable' }
BrTriangle >> collapse [
	self states addState: BrCollapsedState uniqueInstance
]

{ #category : #'api - expandable' }
BrTriangle >> expand [
	self states addState: BrExpandedState uniqueInstance
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
	
	self viewModel: BrButtonModel new.
	self action: [ self toggleExpanded ]
]

{ #category : #'api - expandable' }
BrTriangle >> isExpanded [
	"Return true if an widget is expanded (has expanded state), false otherwise"
	<return: #Boolean>

	^ self states hasState: BrExpandedState uniqueInstance
]

{ #category : #'api - visibility' }
BrTriangle >> show [
	self visibility: BlVisibility visible
]

{ #category : #'api - actions' }
BrTriangle >> toggleAction: aBlock [
	"toggle triangle and then evaluate the block"

	self viewModel action: [ :aWidget :aButtonModel :anEvent |
		self toggleExpanded.
		aBlock glamourValueWithArgs: {
			aWidget.
			aButtonModel.
			anEvent
		} ]
]
