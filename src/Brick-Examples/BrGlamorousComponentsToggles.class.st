Class {
	#name : #BrGlamorousComponentsToggles,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #accessing }
BrGlamorousComponentsToggles >> toggleGroupWithIcons [
	<gtExample>

	^ BrToggleGroup new
		look: BrGlamorousToggleGroupLook new;
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithIconLook new;
			icon: BrGlamorousVectorIcons inspect;
			label: 'Inspect');
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithIconLook new;
			icon: BrGlamorousVectorIcons browse;
			label: 'Browse');
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithIconLook new;
			icon: BrGlamorousVectorIcons play;
			label: 'Play')
]

{ #category : #accessing }
BrGlamorousComponentsToggles >> toggleGroupWithLabels [
	<gtExample>

	^ BrToggleGroup new
		look: BrGlamorousToggleGroupLook new;
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithLabelLook new;
			label: 'Inspect');
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithLabelLook new;
			label: 'Browse');
		addToggle: (BrToggle new
			look: BrGlamorousToggleWithLabelLook new;
			label: 'Play')
]
