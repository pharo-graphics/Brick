"
! Accordion
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
		look: BrGlamorousAccordionLook new;
		header: [
			BrButton new
				look: BrGlamorousAccordionHeaderLook new;
				label: 'Click to expand/collapse';
				action: [ anAccordion toggle ] ];
		content: [
			BrEditor new
				look: BrGlamorousEditorLook new;
				text: (String loremIpsum: 200) trimBoth ].

	^ anAccordion
]
