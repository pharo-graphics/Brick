Class {
	#name : #BrContextMenuBottomLeftLook,
	#superclass : #BrLook,
	#category : #'Brick-Context Menu - Look'
}

{ #category : #initialization }
BrContextMenuBottomLeftLook >> initialize [
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
							c frame vertical alignTop ];
						padding:
							(BlInsets
								top: 0
								left: handle width
								bottom: handle height
								right: 0);
						removeChild: handle;
						addChild: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContentLimitedOffset: handle width.
							c vertical fitContentLimitedOffset: handle height ];
						margin:
							(BlInsets
								top: handle height
								left: 0
								bottom: 0
								right: 0).
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignRight.
							c linear vertical alignTop ] ];
				down: [ :e |  ];
				yourself)
]
