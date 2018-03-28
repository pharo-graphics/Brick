examples - toggle group
removeTogglesFromGroupWithTwoTogglesOneOfWhichActivated
	<gtExample>
	| aToggleGroupModel |
	
	aToggleGroupModel := self addActivatedToggleToGroupWithDeactivatedToggle.
	
	aToggleGroupModel removeToggles.

	self assert: aToggleGroupModel isEmpty.
	self assert: aToggleGroupModel isNotEmpty not.
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel toggles asArray equals: #().
	
	^ aToggleGroupModel