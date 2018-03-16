I add an icon to the widget content. An icon can be any ==BlElement==.

Icon look supports automatic icon property binding to the view model.
For that a view model must respond to the ==BrIconRequest== and reply with a corresponding ==BrIconChanged== event.

For example in a subclass of a ViewModel override ==#onAttachedTo:== and implement:
[[[
	self when: BrIconRequest reply: [ BrIconChanged new icon: self icon ].
]]]