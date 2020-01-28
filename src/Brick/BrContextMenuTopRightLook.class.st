Class {
	#name : #BrContextMenuTopRightLook,
	#superclass : #BrLook,
	#category : #'Brick-Context Menu - Look'
}

{ #category : #initialization }
BrContextMenuTopRightLook >> initialize [
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
							c frame vertical alignBottom ];
						padding:
							(BlInsets
								top: handle height
								left: 0
								bottom: 0
								right: handle width);
						removeChild: handle;
						addChildFirst: handle.
					content
						constraintsDo: [ :c | 
							c horizontal fitContentLimitedOffset: handle width.
							c vertical fitContentLimitedOffset: handle height ];
						margin:
							(BlInsets
								top: 0
								left: 0
								bottom: handle height
								right: 0).
					handle
						constraintsDo: [ :c | 
							c linear horizontal alignLeft.
							c linear vertical alignBottom ] ];
				down: [ :e |  ];
				yourself)
]
