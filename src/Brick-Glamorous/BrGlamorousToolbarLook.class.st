"
I am a horizontal toolbar look
"
Class {
	#name : #BrGlamorousToolbarLook,
	#superclass : #BrToolbarLook,
	#instVars : [
		'spacing'
	],
	#category : #'Brick-Glamorous-Toolbar'
}

{ #category : #factory }
BrGlamorousToolbarLook class >> horizontal [
	self deprecated: 'Use #new instead' transformWith: '`@receiver horizontal' -> '`@receiver new'.
	
	^ self new
]

{ #category : #initialization }
BrGlamorousToolbarLook >> initialize [
	super initialize.
	
	spacing := 4.

	self add: BrLayoutResizerLook inherit.
	self add: BrLayoutAlignmentLook forAlignable.	
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal cellSpacing: spacing ]
]

{ #category : #accessing }
BrGlamorousToolbarLook >> spacing [
	^ spacing
]

{ #category : #accessing }
BrGlamorousToolbarLook >> spacing: aNumber [
	spacing := aNumber.
	
	self widgetDo: [ :anElement | anElement layoutDo: [ :l | l cellSpacing: aNumber ] ]
]
