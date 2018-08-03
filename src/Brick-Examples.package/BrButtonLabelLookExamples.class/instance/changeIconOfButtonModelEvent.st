example - model
changeIconOfButtonModelEvent
	<gtExample>
	| anIconModel aButtonIcon anIconChangedEvent |

	anIconModel := self iconModel.
	aButtonIcon := (BlEllipse extent: 10@10) asElement.
	
	anIconChangedEvent := nil.
	anIconModel when: BrIconChanged do: [ :anEvent | anIconChangedEvent := anEvent copy ].
	
	anIconModel icon: aButtonIcon.
	
	self assert: anIconModel icon equals: aButtonIcon.
	
	self assert: anIconChangedEvent isNotNil.
	self assert: anIconChangedEvent source equals: anIconModel.
	self assert: anIconChangedEvent target equals: anIconModel.
	self assert: anIconChangedEvent currentTarget equals: anIconModel.
	self assert: anIconChangedEvent isConsumed not.
	self assert: anIconChangedEvent traversedTargets size equals: 2.
	
	^ anIconChangedEvent