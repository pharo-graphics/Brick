!!Playing with label  looks  for buttons

When using a label look, the label look embeds the label element directly in the widget element as a child. In the example below, the look is added directly to the button element:
[[[example=BrButtonLabelLookExamples>>#buttonWithDirectlyEmbeddedLabel|expanded=true|expandedPreview=true]]]

If the button has a more complex structure, this behaviour can cause problems. In the example below, the button defines a content element in which the label should be added. However, because the look is added to the button element, the label will be emdedd in the button element instead of the content element:
[[[example=BrButtonLabelLookExamples>>#buttonWithModelAndWrongContentPlacement|expanded=true|expandedPreview=true]]]

To change this behavior, the label look  provides more control over where the label is inserted into the button element: to identify the element in the button element where the label should be placed, the look looks for an element marked with ==#content==. There shoud be only one element marked with  ==#content==.  To fix the problem from the above example,  we can mark the ==aContent== element with ==#content== when adding it to the button element:
[[[example=BrButtonLabelLookExamples>>#buttonWithModelAndLookWithoutConstraints|expanded=true|expandedPreview=true]]]

The label look can directly change properties of the label element. This can be usefull when one wants to change layout properties or update graphical properties of the label:
[[[example=BrButtonLabelLookExamples>>#buttonWithChangedConstraintsInLook|expanded=true|expandedPreview=true]]]

After linking the button element with the label look and the button model, changing the value in the button model updates the label in the button element:
[[[example=BrButtonLabelLookExamples>>#buttonWithModelAndLookAndChangedModelLabel|expanded=true|expandedPreview=true]]]

When changing the label in the model, a ==BlLabelChanged== event is triggered that reaches the label look, through the button widget. The propagation of this element is as follows:
[[[example=BrButtonLabelLookExamples>>#labelChangedEvent|expanded=true|expandedPreview=true|show=gtTraversedLiveFor:]]]

In case the button widget does not have a label look attached, changing the value of the text in the model does not update the visual representation of the label in the button widget:
[[[example=BrButtonLabelLookExamples>>#buttonWithOnlyModelAndChangedModelLabel|expanded=true|expandedPreview=true]]]

When attaching a label look and a button model to a button widget the order in which they are attached does not matter.  If the model is set first then the text value set in the label look is not used; the model has priority  over the label look
[[[example=BrButtonLabelLookExamples>>#buttonWithModelFirstThenLook|expanded=true|expandedPreview=true]]]

If the label look is set first, and the button widget does not have a model the the text value defined in the label look is used. If the button widget  is then assigned a button model, then the value defined in the model is used:
[[[example=BrButtonLabelLookExamples>>#buttonWithLookFirstThenModel|expanded=true|expandedPreview=true]]]