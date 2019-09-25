"
! Brick buttons

Button is one of the most essential graphical components in UI. It can be in a lot of different variaties and forms.
See ${class:BrButtonModel}$ for a more detailed description.

!! Instantiating a button

A button widget is an instance of ${class:BrButton}$. By default it does not have any attached look and therefore has no visual appearance:

${example:BrButtonExamples>>#newButton}$

!! Behavior

A button widget is composed of multiple view models that add important functionality:

- ${class:BrLabelModel}$ is responsible for button's label
- ${class:BrIconModel}$ adds support of an icon
- ${class:BrActivationModel}$ lets users to enable or disable a button (make it non-interactable)
- ${class:BrPressModel}$ provides support of handling press state
- ${class:BrHoverModel}$ adds support of mouse hover events
- ${class:BrDimensionModel}$ is responsible for managing the logical size of a button (tiny, small, large etc)
- ${class:BrLayoutAlignmentModel}$ lets users to align a button's content within the button itself (center, top-right, etc)
- ${class:BrLayoutHorizontalResizerModel}$ provides support for horizontal resizing strategies (fit content, match parent, exact size)
- ${class:BrLayoutVerticalResizerModel}$ is similar to horizontal resizer but controls a vertical resizing strategy

!! Building a button

Button's look can be implemented by composing existing looks or implementing a new one.
"
Class {
	#name : #BrButtonExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Button'
}

{ #category : #'instance creation' }
BrButtonExamples >> newButton [
	<gtExample>
	
	^ BrButton new
]
