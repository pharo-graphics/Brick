Class {
	#name : #BrDropdownBottomLeftAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Dropdown - Look'
}

{ #category : #initialization }
BrDropdownBottomLeftAptitude >> initialize [
	super initialize.
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					| handle content |
					handle := widget childNamed: #handle.
					content := widget childNamed: #content.
					widget
						layout: BlLinearLayout vertical;
						constraintsDo: [ :c | 
							c horizontal fitContentLimited.
							c vertical fitContentLimited.
							c frame horizontal alignRight.
							c frame vertical alignTop ];
						padding:
							(BlInsets
								top: 0
								left: handle width
								bottom: handle height
								right: 0);
						removeChild: handle;
						addChildFirst: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContent.
							c vertical fitContentLimitedOffset: handle height ].
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignRight.
							c linear vertical alignTop ] ];
				down: [ :e |  ];
				yourself)
]
