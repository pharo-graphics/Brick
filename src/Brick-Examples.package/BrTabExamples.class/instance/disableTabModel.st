examples - tab model
disableTabModel
	<gtExample>
	| aTabModel disabled disabledTab enabled disabledHander enabledHandler |
	
	disabled := enabled := 0.
	disabledTab := nil.
	
	aTabModel := self tabModel.
	aTabModel addEventHandler: (disabledHander := BlEventHandler on: BrTabDisabledEvent do: [ :anEvent |
		disabled := disabled + 1.
		disabledTab := anEvent tab ]).
	aTabModel addEventHandler: (enabledHandler := BlEventHandler on: BrTabEnabledEvent do: [	enabled := enabled + 1 ]).
	
	aTabModel disable.
	
	self assert: aTabModel isDisabled.
	self assert: disabled equals: 1.
	self assert: enabled equals: 0.
	self assert: disabledTab equals: aTabModel.

	aTabModel removeEventHandler: disabledHander.
	aTabModel removeEventHandler: enabledHandler.

	^ aTabModel