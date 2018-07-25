! Button model

Button -  An element of a graphical user interface which a user can select to perform a particular action.
(https://en.oxforddictionaries.com/definition/button)

I know how to react on a typical user action such as click or touch event. My reaction is defined by an ==#action== which can be any valuable:  ${class:BlockClosure}$, ${class:Symbol}$ or any object that responds to ==#value==

I am not responsible for labels or icons since buttons not necessarily have them.

The following example shows how to create a new button model and attach an action. In this particular case we set ==#clicked== as an inner domain model to be able to assert that the action  was indeed executed and also inform users about it:
${example:BrButtonModelExamples>>#buttonModel}$

The instantiated button model can be attached to any visual ${class:BlElement}$ as its view model. Once attached, the visual element becomes clickable, as the following example shows:
${example:BrButtonModelExamples>>#elementWithButtonModel|expandedPreview}$

To test the behaviour of the button model we can simulate a click on the element with attached button model and make sure that the action was performed:
${example:BrButtonModelExamples>>#clickOnElementWithButtonModel}$