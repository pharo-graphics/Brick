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
- ${class:BrSizeModel}$ is responsible for managing the logical size of a button (tiny, small, large etc)
- ${class:BrLayoutAlignmentModel}$ lets users to align a button's content within the button itself (center, top-right, etc)
- ${class:BrLayoutHorizontalResizerModel}$ provides support for horizontal resizing strategies (fit content, match parent, exact size)
- ${class:BrLayoutVerticalResizerModel}$ is similar to horizontal resizer but controls a vertical resizing strategy

!! Building a button

Button's look can be implemented by composing existing looks or implementing a new one.

!!! Adding and styling a label

Having ${class:BrLabelModel}$ view model is not enough to create a button with a label. For that we would need to add ${class:BrTextLabelLook}$:
${example:BrButtonExamples>>#buttonWithLabelLook|previewShow=#gtLiveFor:|previewHeight=55|previewExpanded=true}$

Of course, a text style can be customized to match user's preference:
${example:BrButtonExamples>>#buttonWithLabelLookAndCustomFont|previewShow=#gtLiveFor:|previewHeight=70|previewExpanded=true}$

Quite often though, it may be needed to change label's style when users hover a button. ${class:BrHoverModel}$ handles widget hover state change. To style the text accordingly we can add ${class:BrInteractiveCommonLook}$ to the previosly created ${class:BrTextLabelLook}$. Please note that we should also provide default values for all button properties that change due to interactivity in a ==default:== style:
${example:BrButtonExamples>>#buttonWithLabelLookReactingToHover|previewShow=#gtLiveFor:|previewHeight=70|previewExpanded=true}$

In a similar fashing we can also change the text style on a button press which is managed by ${class:BrPressModel}$:
${example:BrButtonExamples>>#buttonWithLabelLookReactingToHoverAndPress|previewShow=#gtLiveFor:|previewHeight=70|previewExpanded=true}$

One more common use-case is to provide a text style for a disabled button which is modelled by ${class:BrActivationModel}$. Please note that disabled button does not react to click and hover events:
${example:BrButtonExamples>>#buttonWithLabelLookReactingToHoverAndPressAndDisabled|previewShow=#gtLiveFor:|previewHeight=70|previewExpanded=true}$

Sometimes users may want to create a look that depends on a logical button size modelled by ${class:BrSizeModel}$. For example a button can be made huge ==beHuge== or tiny ==beTiny==. To style a label based on the logical widget size we can use ${class:BrInteractiveSizeLook}$ which provides a fluent api for variuos sizes. Click on the label to randomly change its logial size:
${example:BrButtonExamples>>#buttonWithLabelLookOfDifferentSizes|previewShow=#gtLiveFor:|previewHeight=70|previewExpanded=true}$

Now lets put together the final label look that we will use later to build our custom button:
${example:BrButtonExamples>>#labelLookWithCommonAndSizeInteractions}$

!!! Adding and styling the button's exterior


"
Class {
	#name : #BrButtonExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Button'
}

{ #category : #'instance creation' }
BrButtonExamples >> buttonAndLookWithLabelAndExterior [
	<gtExample>
	| aButtonLook aLabelLook anExteriorLook |
	
	aLabelLook := BrTextLabelLook new.
	aLabelLook
		bold;
		fontName: 'Source Sans Pro'.

	aLabelLook add: (BrInteractiveCommonLook new
		default: [ aLabelLook foreground: Color gray ];
		hovered: [ aLabelLook foreground: Color white ];
		pressed: [ aLabelLook foreground: Color paleBlue ];
		disabled: [ aLabelLook foreground: Color veryLightGray ]).

	aLabelLook add: (BrSizeAdjustmentLook new
		default: [ aLabelLook fontSize: 20 ];
		tiny: [ aLabelLook fontSize: 10 ];
		small: [ aLabelLook fontSize: 16 ];
		large: [ aLabelLook fontSize: 26 ];
		huge: [ aLabelLook fontSize: 36 ]).
		
	anExteriorLook := BrInteractiveCommonLook new.
	anExteriorLook
		default: [ :aWidget |
			aWidget padding: (BlInsets top: 5 left: 10 bottom: 5 right: 10).
			aWidget background: Color veryVeryLightGray ];
		hovered: [ :aWidget | aWidget background: (Color r: 0.27 g: 0.67 b: 0.99) ];
		pressed: [ :aWidget | aWidget background: (Color r: 0.04 g: 0.43 b: 0.85) ];
		disabled: [ :aWidget | aWidget background: Color veryVeryLightGray ].
		
	anExteriorLook add: (BrLayoutResizerLook inherit).
	anExteriorLook add: (BrLayoutAlignmentLook forHorizontalLinearLayout).
	anExteriorLook add: (BrFlatShadowLook new offset: 3@3).
		
	aButtonLook := BrLook new.
	aButtonLook addAll: { aLabelLook . anExteriorLook }.

	^ self newButton
		label: 'Button';
		look: aButtonLook
]

{ #category : #'instance creation' }
BrButtonExamples >> buttonWithExteriorLook [
	<gtExample>
	| anExteriorLook |
	
	anExteriorLook := BrInteractiveCommonLook new.
	anExteriorLook
		default: [ :aWidget | aWidget background: Color veryVeryLightGray ];
		hovered: [ :aWidget | aWidget background: (Color r: 0.27 g: 0.67 b: 0.99) ];
		pressed: [ :aWidget | aWidget background: (Color r: 0.04 g: 0.43 b: 0.85) ];
		disabled: [ :aWidget | aWidget background: Color veryVeryLightGray ].

	^ self newButton
		look: anExteriorLook
]

{ #category : #'instance creation' }
BrButtonExamples >> buttonWithLabelLook [
	<gtExample>
	| aLabelLook |
	
	aLabelLook := BrTextLabelLook new.
	
	^ self newButton
		look: aLabelLook
]

{ #category : #'instance creation' }
BrButtonExamples >> buttonWithLabelLookAndCustomFont [
	<gtExample>
	| aLabelLook |
	
	aLabelLook := BrTextLabelLook new.
	aLabelLook
		bold;
		fontName: 'Source Sans Pro';
		fontSize: 20;
		foreground: Color gray.

	^ self newButton
		look: aLabelLook
]

{ #category : #'instance creation' }
BrButtonExamples >> buttonWithLabelLookOfDifferentSizes [
	<gtExample>
	| aLabelLook |
	
	aLabelLook := BrTextLabelLook new.
	aLabelLook
		bold;
		fontName: 'Source Sans Pro'.

	aLabelLook add: (BrSizeAdjustmentLook new
		default: [ aLabelLook fontSize: 20 ];
		tiny: [ aLabelLook fontSize: 10 ];
		small: [ aLabelLook fontSize: 16 ];
		large: [ aLabelLook fontSize: 26 ];
		huge: [ aLabelLook fontSize: 36 ]).

	^ self newButton
		action: [ :aButton | aButton perform: #(beNormal beTiny beSmall beLarge beHuge) atRandom ];
		beSmall;
		look: aLabelLook
]

{ #category : #'instance creation' }
BrButtonExamples >> buttonWithLabelLookReactingToHover [
	<gtExample>
	| aLabelLook |
	
	aLabelLook := BrTextLabelLook new.
	aLabelLook
		bold;
		fontName: 'Source Sans Pro';
		fontSize: 20.

	aLabelLook add: (BrInteractiveCommonLook new
		default: [ aLabelLook foreground: Color gray ];
		hovered: [ aLabelLook foreground: Color darkGray ]).

	^ self newButton
		look: aLabelLook
]

{ #category : #'instance creation' }
BrButtonExamples >> buttonWithLabelLookReactingToHoverAndPress [
	<gtExample>
	| aLabelLook |
	
	aLabelLook := BrTextLabelLook new.
	aLabelLook
		bold;
		fontName: 'Source Sans Pro';
		fontSize: 20.

	aLabelLook add: (BrInteractiveCommonLook new
		default: [ aLabelLook foreground: Color gray ];
		hovered: [ aLabelLook foreground: Color darkGray ];
		pressed: [ aLabelLook foreground: Color black ]).

	^ self newButton
		look: aLabelLook
]

{ #category : #'instance creation' }
BrButtonExamples >> buttonWithLabelLookReactingToHoverAndPressAndDisabled [
	<gtExample>
	| aLabelLook |
	
	aLabelLook := BrTextLabelLook new.
	aLabelLook
		bold;
		fontName: 'Source Sans Pro';
		fontSize: 20.

	aLabelLook add: (BrInteractiveCommonLook new
		default: [ aLabelLook foreground: Color gray ];
		hovered: [ aLabelLook foreground: Color darkGray ];
		pressed: [ aLabelLook foreground: Color black ];
		disabled: [ aLabelLook foreground: Color veryLightGray ]).

	^ self newButton
		disable;
		look: aLabelLook
]

{ #category : #'instance creation' }
BrButtonExamples >> labelLookWithCommonAndSizeInteractions [
	<gtExample>
	| aLabelLook |
	
	aLabelLook := BrTextLabelLook new.
	aLabelLook
		bold;
		fontName: 'Source Sans Pro'.

	aLabelLook add: (BrInteractiveCommonLook new
		default: [ aLabelLook foreground: Color gray ];
		hovered: [ aLabelLook foreground: Color darkGray ];
		pressed: [ aLabelLook foreground: Color black ];
		disabled: [ aLabelLook foreground: Color veryLightGray ]).

	aLabelLook add: (BrSizeAdjustmentLook new
		default: [ aLabelLook fontSize: 20 ];
		tiny: [ aLabelLook fontSize: 10 ];
		small: [ aLabelLook fontSize: 16 ];
		large: [ aLabelLook fontSize: 26 ];
		huge: [ aLabelLook fontSize: 36 ]).

	^ aLabelLook
]

{ #category : #'instance creation' }
BrButtonExamples >> newButton [
	<gtExample>
	
	^ BrButton new
]
