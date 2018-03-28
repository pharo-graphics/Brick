examples - toggle group
removeActivatedToggleFromGroupWithOneToggle
	<gtExample>
	| aToggleGroupModel aToggleModel |
	
	aToggleGroupModel := self addActivatedToggleToEmptyGroup.
	
	aToggleModel := aToggleGroupModel toggles first.
	
	aToggleGroupModel removeToggle: aToggleModel.

	self assert: aToggleGroupModel isEmpty.
	self assert: aToggleGroupModel isNotEmpty not.
	self assert: aToggleGroupModel hasActivatedToggle not.
	self assert: aToggleGroupModel toggles asArray equals: #().

	self assert: aToggleModel isActivated not.
	self assert: aToggleModel isOneWay.	"toggle model stays one way"
	
	^ aToggleGroupModel