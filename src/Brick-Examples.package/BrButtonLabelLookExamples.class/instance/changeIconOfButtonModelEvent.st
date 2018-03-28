example - model
changeIconOfButtonModelEvent
	<gtExample>
	| aButtonModel aButtonIcon anIconChangedEvent |

	aButtonModel := self buttonModel.
	aButtonIcon := (BlEllipse extent: 10@10) asElement.
	
	anIconChangedEvent := nil.
	aButtonModel when: BrIconChanged do: [ :anEvent | anIconChangedEvent := anEvent copy ].
	
	aButtonModel icon: aButtonIcon.
	
	self assert: aButtonModel icon equals: aButtonIcon.
	
	self assert: anIconChangedEvent isNotNil.
	self assert: anIconChangedEvent source equals: aButtonModel.
	self assert: anIconChangedEvent target equals: aButtonModel.
	self assert: anIconChangedEvent currentTarget equals: aButtonModel.
	self assert: anIconChangedEvent isConsumed not.
	self assert: anIconChangedEvent traversedTargets size equals: 2.
	
	^ anIconChangedEvent