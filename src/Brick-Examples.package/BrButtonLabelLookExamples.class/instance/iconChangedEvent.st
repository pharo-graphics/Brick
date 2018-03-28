example - events
iconChangedEvent
	<gtExample>
	| aButton newIcon anIconChangedEvent |

	anIconChangedEvent := nil.
	newIcon := (BlEllipse extent: 10@10) asElement.

	aButton := self buttonWithModelAndLookWithoutConstraints.
	aButton look when: BrIconChanged do: [ :anEvent | anIconChangedEvent := anEvent copy ].
	aButton viewModel icon: newIcon.
	
	self assert: aButton viewModel icon equals: newIcon.

	self assert: anIconChangedEvent notNil.
	self assert: anIconChangedEvent isConsumed not.
	self assert: anIconChangedEvent target equals: aButton look.
	self assert: anIconChangedEvent currentTarget equals: aButton look.
	self assert: anIconChangedEvent source equals: aButton viewModel.
	self assert: anIconChangedEvent icon equals: newIcon.
	self assert: anIconChangedEvent timestamp isNil.
	self assert: anIconChangedEvent traversedTargets size equals: 6.

	^ anIconChangedEvent