I add a text label to the widget content. 

Label look supports automatic label or text property binding to the view model.
For that a view model must respond to the ==BrLabelRequest== and reply with a corresponding ==BrLabelChanged== event.

For example in a subclass of a ViewModel override ==#onAttachedTo:== and implement:
[[[
	self when: BrLabelRequest reply: [ BrLabelChanged new text: self label ].
]]]