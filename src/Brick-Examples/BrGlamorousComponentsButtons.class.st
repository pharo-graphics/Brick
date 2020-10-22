"
!Buttons
Use Glamorous buttons for actions in forms, popups or other views with support for multiple styles, sizes, states and more.
!!!Relevant documents
${class:BrButtonExamples|label=Building a custom button look}$, ${class:BrButtonModelExamples|label=Learning how button model works}$, ${class:BrButtonLabelLookExamples|label=Playing with button label look}$
!!With label
!!!!Default labelled button
${example:BrGlamorousComponentsButtons>>#withLabel|previewShow=#gtLiveFor:|previewHeight=65|previewExpanded=true|codeExpanded=false}$
!!!!Disabled labelled button
${example:BrGlamorousComponentsButtons>>#withLabelDisabled|previewShow=#gtLiveFor:|previewHeight=65|previewExpanded=true|codeExpanded=false}$
!!!!Labelled buttons of different size
${example:BrGlamorousComponentsButtons>>#withLabelSizes|previewShow=#gtLiveFor:|previewHeight=85|previewExpanded=true|codeExpanded=false}$
"
Class {
	#name : #BrGlamorousComponentsButtons,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabel [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Default';
		action: [ :aButton | 'Clicked' traceCr ]
]

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabelDisabled [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Default';
		disable
]

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabelHuge [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Huge';
		beHuge
]

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabelLarge [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Large';
		beLarge
]

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabelMini [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Mini';
		beMini
]

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabelNormal [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Normal';
		beNormal
]

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabelSizes [
	<gtExample>
	^ BrHorizontalPane new
		fitContent;
		cellSpacing: 10;
		addChildren: { 
			self withLabelMini.
			self withLabelTiny.
			self withLabelSmall.
			self withLabelNormal.
			self withLabelLarge.
			self withLabelHuge
		}
]

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabelSmall [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Small';
		beSmall
]

{ #category : #accessing }
BrGlamorousComponentsButtons >> withLabelTiny [
	<gtExample>
	
	^ BrButton new
		look: BrGlamorousButtonWithLabelLook new;
		label: 'Tiny';
		beTiny
]
