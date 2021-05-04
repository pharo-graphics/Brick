Class {
	#name : #BrGlamorousProgressWithLabelAptitude,
	#superclass : #BrAptitude,
	#traits : 'TBlTextStyleable',
	#classTraits : 'TBlTextStyleable classTrait',
	#instVars : [
		'labelLook'
	],
	#category : #'Brick-Glamorous-Progress'
}

{ #category : #accessing }
BrGlamorousProgressWithLabelAptitude >> attributesBuilder [
	<return: #BlTextAttributesBuilder>
	
	^ labelLook attributesBuilder
]

{ #category : #initialization }
BrGlamorousProgressWithLabelAptitude >> initialize [
	super initialize.
	
	self addChangeProperty: #(widget layout) with: [ BlLinearLayout vertical ].
	self addChangeProperty: #(widget constraints horizontal resizer) with: [ BlLayoutResizer matchParent ].
	self addChangeProperty: #(widget constraints vertical resizer) with: [ BlLayoutResizer fitContent ].
	
	self addAll: {
		labelLook := BrGlamorousProgressLabelAptitude new.
	}
]
