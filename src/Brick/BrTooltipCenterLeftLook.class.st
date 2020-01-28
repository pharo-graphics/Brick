Class {
	#name : #BrTooltipCenterLeftLook,
	#superclass : #BrLook,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #initialization }
BrTooltipCenterLeftLook >> initialize [
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
							c frame horizontal alignRight.
							c frame vertical alignCenter ];
						padding:
							(BlInsets
								top: handle height
								left: handle width
								bottom: handle height
								right: 0);
						removeChild: handle;
						addChild: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContentLimitedOffset: handle width.
							c vertical fitContent ].
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignRight.
							c linear vertical alignCenter ] ];
				down: [ :e |  ];
				yourself)
]
