as yet unclassified
markChanged
	 
	widget indeterminate
		ifTrue: [ mark geometry: self indeterminateMark; extent: 20 @ 20.
			mark visibility: BlVisibility visible.
			controller activateState: BlIndeterminateState.
			^ self ].
	widget checked
		ifTrue: [ mark geometry: self checkedMark; extent: 20 @ 20.
			mark visibility: BlVisibility visible.
			controller deactivateState: BlIndeterminateState.
			controller activateState: BlCheckedState.
			^ self ].
	mark visibility: BlVisibility hidden.
	controller deactivateState: BlIndeterminateState.
	controller deactivateState: BlCheckedState.