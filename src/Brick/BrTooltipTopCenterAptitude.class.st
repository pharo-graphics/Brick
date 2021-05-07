Class {
	#name : #BrTooltipTopCenterAptitude,
	#superclass : #BrAptitude,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #initialization }
BrTooltipTopCenterAptitude >> initialize [
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
							c frame vertical alignBottom ];
						padding:
							(BlInsets
								top: handle height
								left: handle width
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
							c linear horizontal alignCenter.
							c linear vertical alignBottom ] ];
				down: [ :e |  ];
				yourself)
]
