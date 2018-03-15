!!Playing with looks 

Let's take a look at a toggle button as an example. A toggle button is made of an element and an associated view model. To have it drawn on the screen, we add a look to it, such as an icon:
[[[example=BrToggleExamples>>#toogleWithMaterialIcon|expanded=true|show=gtLiveIn:]]]

Or a label:
[[[example=BrToggleExamples>>#toogleWithMaterialLabel|expanded=true|show=gtLiveIn:]]]

The icon and the label can also be combined:
[[[example=BrToggleExamples>>#toggleWithMaterialIconAndLabel|expanded=true|show=gtLiveIn:]]]

Changing the order of composition can also affect the rendering. In this case, the icon appears to the right of the label:
[[[example=BrToggleExamples>>#toggleWithMaterialLabelAndIcon|expanded=true|show=gtLiveIn:]]]

But, looks can also influence the behavior of a widget. For example, to change the icon depending of the state of the toggle, we simply make hte look listen to the toggle event and change the icon from the view model:
[[[example=BrToggleExamples>>#toggleWithMaterialChangingIcon|expanded=true|show=gtLiveIn:]]]
