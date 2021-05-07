"
I am a horizontal toolbar look
"
Class {
	#name : #BrGlamorousToolbarAptitude,
	#superclass : #BrToolbarAptitude,
	#instVars : [
		'spacing'
	],
	#category : #'Brick-Glamorous-Toolbar'
}

{ #category : #factory }
BrGlamorousToolbarAptitude class >> horizontal [
	self deprecated: 'Use #new instead' transformWith: '`@receiver horizontal' -> '`@receiver new'.
	
	^ self new
]

{ #category : #initialization }
BrGlamorousToolbarAptitude >> initialize [
	super initialize.
	
	spacing := 4.

	self add: BrLayoutResizerAptitude inherit.
	self add: BrLayoutAlignmentAptitude forAlignable.	
	self
		addChangeProperty: #(widget layout)
		with: [ BlLinearLayout horizontal cellSpacing: spacing ]
]

{ #category : #accessing }
BrGlamorousToolbarAptitude >> spacing [
	^ spacing
]

{ #category : #accessing }
BrGlamorousToolbarAptitude >> spacing: aNumber [
	spacing := aNumber.
	
	self widgetDo: [ :anElement | anElement layoutDo: [ :l | l cellSpacing: aNumber ] ]
]
