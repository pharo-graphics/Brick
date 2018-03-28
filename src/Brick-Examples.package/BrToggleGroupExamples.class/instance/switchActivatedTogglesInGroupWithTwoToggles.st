examples - model
switchActivatedTogglesInGroupWithTwoToggles
	<gtExample>
	| aToggleGroupModel aToggleModelActivated aToggleModelDeactivated |
	
	aToggleGroupModel := self addActivatedAndDeactivatedTogglesToEmptyGroup.
	
	"currently activated; will be deactivated"
	aToggleModelDeactivated := aToggleGroupModel toggles first.
	
	"currently deactivated; will be activated"
	aToggleModelActivated := aToggleGroupModel toggles second.
	
	aToggleModelActivated activate.

	self assert: aToggleGroupModel hasActivatedToggle.
	self assert: aToggleGroupModel activatedToggle equals: aToggleModelActivated.
	self assert: aToggleGroupModel toggles asArray equals: { aToggleModelDeactivated . aToggleModelActivated }.
	
	self assert: aToggleModelActivated isActivated.
	self assert: aToggleModelDeactivated isActivated not .

	^ aToggleGroupModel