"
!Tabs
Tab is a graphical control element that allows multiple documents or panels to be contained within a single window, using tabs as a navigational widget for switching between sets of documents.
!!!! Default tabbable region
${example:BrGlamorousComponentsTabs>>#defaultTabs|previewShow=#gtLiveFor:|previewHeight=200|previewExpanded=true|codeExpanded=false}$
"
Class {
	#name : #BrGlamorousComponentsTabs,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #examples }
BrGlamorousComponentsTabs >> defaultTabs [
	<gtExample>

	^ BrTabGroup new
		aptitude: BrGlamorousTabGroupAptitude new;
		addTab: (BrTab new
			aptitude: BrGlamorousTabAptitude new;
			label: 'Tab 1';
			stencil: [
				BrFrame new
					exact: 300@150;
					margin: (BlInsets all: 10);
					background: (Color red alpha: 0.2) ]);
		addTab: (BrTab new
			aptitude: BrGlamorousTabAptitude new;
			label: 'Tab 2';
			stencil: [
				BrFrame new
					hMatchParent;
					vExact: 50;
					margin: (BlInsets all: 10);
					background: (Color blue alpha: 0.2) ]);
		addTab: (BrTab new
			aptitude: BrGlamorousTabAptitude new;
			label: 'Tab 3';
			stencil: [
				BrFrame new
					hMatchParent;
					vExact: 100;
					margin: (BlInsets all: 10);
					background: (Color orange alpha: 0.2) ])
]
