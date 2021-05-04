Class {
	#name : #BrGlamorousComponentsToggles,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #accessing }
BrGlamorousComponentsToggles >> toggleGroupWithIcons [
	<gtExample>

	^ BrToggleGroup new
		aptitude: BrGlamorousToggleGroupAptitude new;
		addToggle: (BrToggle new
			aptitude: BrGlamorousToggleWithIconAptitude new;
			icon: BrGlamorousVectorIcons inspect;
			label: 'Inspect');
		addToggle: (BrToggle new
			aptitude: BrGlamorousToggleWithIconAptitude new;
			icon: BrGlamorousVectorIcons browse;
			label: 'Browse');
		addToggle: (BrToggle new
			aptitude: BrGlamorousToggleWithIconAptitude new;
			icon: BrGlamorousVectorIcons play;
			label: 'Play')
]

{ #category : #accessing }
BrGlamorousComponentsToggles >> toggleGroupWithLabels [
	<gtExample>

	^ BrToggleGroup new
		aptitude: BrGlamorousToggleGroupAptitude new;
		addToggle: (BrToggle new
			aptitude: BrGlamorousToggleWithLabelAptitude new;
			label: 'Inspect');
		addToggle: (BrToggle new
			aptitude: BrGlamorousToggleWithLabelAptitude new;
			label: 'Browse');
		addToggle: (BrToggle new
			aptitude: BrGlamorousToggleWithLabelAptitude new;
			label: 'Play')
]
