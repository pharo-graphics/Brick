Class {
	#name : #BrGlamorousComponentsToggles,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #accessing }
BrGlamorousComponentsToggles >> toggleGroupWithIcons [
	<gtExample>

	^ BrToggleGroup new
		look: BrGlamorousToggleGroupAptitude new;
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithIconAptitude new;
			icon: BrGlamorousVectorIcons inspect;
			label: 'Inspect');
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithIconAptitude new;
			icon: BrGlamorousVectorIcons browse;
			label: 'Browse');
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithIconAptitude new;
			icon: BrGlamorousVectorIcons play;
			label: 'Play')
]

{ #category : #accessing }
BrGlamorousComponentsToggles >> toggleGroupWithLabels [
	<gtExample>

	^ BrToggleGroup new
		look: BrGlamorousToggleGroupAptitude new;
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithLabelAptitude new;
			label: 'Inspect');
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithLabelAptitude new;
			label: 'Browse');
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithLabelAptitude new;
			label: 'Play')
]
