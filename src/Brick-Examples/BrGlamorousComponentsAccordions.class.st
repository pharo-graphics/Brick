"
!Accordion
The accordion is a graphical control element that can be ""expanded"" or ""collapsed"" to reveal the content associated with that element. 
See ${class:BrAccordionExamples|label=Accordion examples}$ for a deeper dive into the api.
!!!!With editor
${example:BrGlamorousComponentsAccordions>>#withEditor|previewShow=#gtLiveFor:|previewHeight=150|previewExpanded=true|codeExpanded=false}$
"
Class {
	#name : #BrGlamorousComponentsAccordions,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #examples }
BrGlamorousComponentsAccordions >> withEditor [
	<gtExample>
	| anAccordion |
	anAccordion := BrAccordion new.
	anAccordion
		hMatchParent;
		vFitContent;
		aptitude: BrGlamorousAccordionAptitude new;
		header: [ BrButton new
				aptitude: BrGlamorousAccordionHeaderAptitude new;
				label: 'Click to expand/collapse';
				action: [ anAccordion toggleExpanded ] ];
		content: [ BrEditor new
				aptitude: BrGlamorousEditorAptitude new;
				text: (String loremIpsum: 200) trimBoth ].
	^ anAccordion
]
