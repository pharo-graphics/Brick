Class {
	#name : #BrTooltipTopLeftLook,
	#superclass : #BrLook,
	#category : #'Brick-Tooltip - Look'
}

{ #category : #initialization }
BrTooltipTopLeftLook >> initialize [
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
							c frame vertical alignBottom ];
						padding:
							(BlInsets
								top: handle height
								left: handle width
								bottom: 0
								right: 0);
						removeChild: handle;
						addChild: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContent.
							c vertical fitContentLimitedOffset: handle height ].
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignRight.
							c linear vertical alignBottom ] ];
				down: [ :e |  ];
				yourself)
]
