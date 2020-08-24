"
! Progress bar
I exemplify ${class:BrProgress}$ with glamorous looks.
!! Progress Bar Only 
${example:BrGlamorousProgressExamples>>#barOnly_MainUsage|codeExpanded=false|previewExpanded=true|previewHeight=180}$
!! Progress Bar With Text Above 
${example:BrGlamorousProgressExamples>>#barAndTextAbove_MainUsage|codeExpanded=false|previewExpanded=true|previewHeight=180}$

!! Progress Bar With Text Below 
${example:BrGlamorousProgressExamples>>#barAndTextBelow_MainUsage|codeExpanded=false|previewExpanded=true|previewHeight=180}$

"
Class {
	#name : #BrGlamorousProgressExamples,
	#superclass : #Object,
	#instVars : [
		'progressExamples'
	],
	#category : #'Brick-Examples-Progress'
}

{ #category : #'examples - basic compositions' }
BrGlamorousProgressExamples >> barAndTextAbove [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress
		layout: BlLinearLayout vertical;
			constraintsDo: [ :c | 
				c horizontal matchParent.
				c vertical fitContent ].
	aProgress look: BrGlamorousProgressLabelLook + BrGlamorousProgressBarLook.
	^ aProgress
]

{ #category : #'examples - main compositions' }
BrGlamorousProgressExamples >> barAndTextAbove_MainUsage [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress look: BrGlamorousProgressWithLabelAndBarLook.
	^ aProgress
]

{ #category : #'examples - main compositions' }
BrGlamorousProgressExamples >> barAndTextBelow_MainUsage [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress look: BrGlamorousProgressWithBarAndLabelLook.
	^ aProgress
]

{ #category : #'examples - basic compositions' }
BrGlamorousProgressExamples >> barOnly [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress look: BrGlamorousProgressBarLook.
	^ aProgress
]

{ #category : #'examples - main compositions' }
BrGlamorousProgressExamples >> barOnly_MainUsage [
	<gtExample>
	| aProgress |
	aProgress := self thirtyPercentProgress.
	aProgress look: BrGlamorousProgressWithBarLook.
	^ aProgress
]

{ #category : #initialization }
BrGlamorousProgressExamples >> initialize [
	super initialize.
	progressExamples := BrProgressExamples new.
]

{ #category : #'examples - basic widget' }
BrGlamorousProgressExamples >> thirtyPercentProgress [
	<gtExample>
	^ progressExamples thirtyPercentProgress
		constraintsDo: [ :c | 
			c horizontal matchParent ];
		patternLabel: '{1}% out of {2}% is finished'
]
