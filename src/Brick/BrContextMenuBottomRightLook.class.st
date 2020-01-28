Class {
	#name : #BrContextMenuBottomRightLook,
	#superclass : #BrLook,
	#category : #'Brick-Context Menu - Look'
}

{ #category : #initialization }
BrContextMenuBottomRightLook >> initialize [
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
							c frame vertical alignTop ];
						padding:
							(BlInsets
								top: 0
								left: 0
								bottom: handle height
								right: handle width);
						removeChild: handle;
						addChildFirst: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContentLimitedOffset: handle width.
							c vertical fitContentLimitedOffset: handle height ];
						margin:
							(BlInsets
								top: handle width
								left: 0
								bottom: 0
								right: 0).
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignLeft.
							c linear vertical alignTop ] ];
				down: [ :e |  ];
				yourself)
]
