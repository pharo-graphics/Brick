Class {
	#name : #BrTooltipBottomCenterAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #initialization }
BrTooltipBottomCenterAptitude >> initialize [
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
							c frame horizontal alignCenter.
							c frame vertical alignTop ];
						padding:
							(BlInsets
								top: 0
								left: handle width
								bottom: handle height
								right: handle width);
						removeChild: handle;
						addChildFirst: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContent.
							c vertical fitContentLimitedOffset: handle height ].
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignCenter.
							c linear vertical alignTop ] ];
				down: [ :e |  ];
				yourself)
]
