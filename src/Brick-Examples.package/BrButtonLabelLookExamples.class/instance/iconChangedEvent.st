example - events
iconChangedEvent
	<gtExample>
	| aButton newIcon anIconChangedEvent |

	anIconChangedEvent := nil.
	newIcon := (BlEllipse extent: 10@10) asElement.

	aButton := self buttonWithModelAndLookWithoutConstraints.
	aButton look when: BrIconChanged do: [ :anEvent | anIconChangedEvent := anEvent copy ].
	aButton viewModel widgetModels second icon: newIcon.
	
	self assert: aButton viewModel widgetModels second icon equals: newIcon.

	self assert: anIconChangedEvent notNil.
	self assert: anIconChangedEvent isConsumed not.
	self assert: anIconChangedEvent target equals: aButton look.
	self assert: anIconChangedEvent currentTarget equals: aButton look.
	self assert: anIconChangedEvent source equals: aButton viewModel widgetModels second.
	self assert: anIconChangedEvent icon equals: newIcon.
	self assert: anIconChangedEvent timestamp isNil.

	self flag: 'anIconChangedEvent traversedTargets size is sometimes 6, sometimes 8'.
	"self assert: anIconChangedEvent traversedTargets size equals: 6."
	self assert: ( #( 6 8 ) includes: anIconChangedEvent traversedTargets size).

	

	^ anIconChangedEvent