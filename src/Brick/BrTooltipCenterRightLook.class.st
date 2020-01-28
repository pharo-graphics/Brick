Class {
	#name : #BrTooltipCenterRightLook,
	#superclass : #BrLook,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #initialization }
BrTooltipCenterRightLook >> initialize [
	super initialize.
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					| handle content |
					handle := widget childNamed: #handle.
					content := widget childNamed: #content.
					widget
						layout: BlLinearLayout horizontal;
						constraintsDo: [ :c | 
							c horizontal fitContentLimited.
							c vertical fitContentLimited.
							c frame horizontal alignLeft.
							c frame vertical alignCenter ];
						padding:
							(BlInsets
								top: handle height
								left: 0
								bottom: handle height
								right: handle width);
						removeChild: handle;
						addChildFirst: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContentLimitedOffset: handle width.
							c vertical fitContent ].
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignLeft.
							c linear vertical alignCenter ] ];
				down: [ :e |  ];
				yourself)
]
