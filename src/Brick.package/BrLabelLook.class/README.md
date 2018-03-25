I am a look that automatically adds a text label to the content element in a widget element. 

I am independent of the widget model and the widget element. 
If the widget model  responds to the ==BrLabelRequest== and replies with a corresponding ==BrLabelChanged== event, then I automatically update the label based on the model.

For example, to in a subclass of a ViewModel override ==#onAttachedTo:== and implement:
[[[
	self when: BrLabelRequest reply: [ BrLabelChanged new text: self label ].
]]]

The label look can directly change properties of the label element. This can be usefull when one want to customize the existing look, or change layout properties:
[[[example=BrButtonLabelLookExamples>>#buttonLabelLookWithConstraints|expanded=true|expandedPreview=false|show=gtLiveIn:]]]
