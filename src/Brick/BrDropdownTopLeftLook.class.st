Class {
	#name : #BrDropdownTopLeftLook,
	#superclass : #BrLook,
	#category : #'Brick-Dropdown - Look'
}

{ #category : #initialization }
BrDropdownTopLeftLook >> initialize [
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
							c frame horizontal alignLeft.
							c frame vertical alignBottom ];
						padding:
							(BlInsets
								top: handle height
								left: 0
								bottom: 0
								right: handle width);
						removeChild: handle;
						addChild: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContent.
							c vertical fitContentLimitedOffset: handle height ].
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignLeft.
							c linear vertical alignBottom ] ];
				down: [ :e |  ];
				yourself)
]
