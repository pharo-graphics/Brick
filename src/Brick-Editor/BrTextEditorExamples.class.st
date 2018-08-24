"
! Today we will learn how to compose an editor 🙊

==It is as simple as computing a factorial, a piece of cake! == 🍰

[[[show=gtPrintIn:
	10 factorial
]]]

!!! 🔹 First create the text 💁

[[[example=BrTextEditorExamples>>#newText]]]

!!! 🔸 Next, we build the editor 👷

[[[example=BrTextEditorExamples>>#newEditor]]]

!!! 🔹 Then, we attach text to the enditor. 💡

[[[example=BrTextEditorExamples>>#editor:text:]]]

!!! 🔸 Next, we create an editor element. 🤘

[[[example=BrTextEditorExamples>>#newElement|show=gtLiveIn:]]]

!!! 🔹 And finally, build everything together 💪

[[[example=BrTextEditorExamples>>#element:editorText:|show=gtLiveIn:]]]

! Done 😎

"
Class {
	#name : #BrTextEditorExamples,
	#superclass : #Object,
	#classInstVars : [
		'loremIpsum'
	],
	#category : 'Brick-Editor-Examples'
}

{ #category : #cleanup }
BrTextEditorExamples class >> cleanUp [
	super cleanUp.
	
	loremIpsum := nil 
]

{ #category : #'examples - comparison' }
BrTextEditorExamples class >> exampleEditor [
	| space editorElement editor text |

	editorElement := BrEditorElement new.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	editor := BrTextEditor new.
	text := BlRopedText string: self loremIpsum.
	
	editor text: text.
	editorElement editor: editor.

	space := BlSpace new.
	space extent: self extent.
	space root addChild: editorElement.
	space show
]

{ #category : #examples }
BrTextEditorExamples class >> exampleMethodTextOpen [
	| space editorElement |

	editorElement := (self >> #elementOnMethodWithSyntaxHighlighting) gtExample returnValue.
	editorElement editor text attributes: {
		(BrFontSizeAttribute size: 18) beNotOverwritableByStyler.
		BrFontGenericFamilyAttribute monospace beNotOverwritableByStyler
	}.
	editorElement editor text attributes: {
		BrTextHoverAttribute new beNotOverwritableByStyler.
		BrTextClickAttribute new beNotOverwritableByStyler
	} from: 39 to: 42.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	space := BlSpace new.
	space extent: 800@400.
	space root addChild: editorElement.
	space show.
]

{ #category : #examples }
BrTextEditorExamples class >> exampleMethodTextOpenEmbedElement [
	| space editorElement |

	editorElement := (self >> #elementWithMethod) gtExample returnValue.
	editorElement editor text attributes: {
		BrFontSizeAttribute size: 18.
		BrFontGenericFamilyAttribute monospace
	}.
	editorElement editor text attributes: {
		BrTextAdornmentDynamicAttribute new stencil: [ BlElement new size: 70 @ 50; background: Color red; yourself ]
	} from: 30 to: 30.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].

	space := BlSpace new.
	space extent: 800@400.
	space root addChild: editorElement.
	space show.
]

{ #category : #'examples - comparison' }
BrTextEditorExamples class >> exampleOneEditorTwoElements [
	| space1 editorElement1 space2 editorElement2 editor styler |

	editor := BrTextEditor new.

	styler := BrRBTextStyler new.
	styler classOrMetaClass: Morph.
	editor styler: styler.
	
	editor text: ((BlRopedText string: (Morph>>#fullDrawOn:) sourceCode) attributes: {
		(BrFontSizeAttribute size: 14) beNotOverwritableByStyler.
		BrFontGenericFamilyAttribute monospace beNotOverwritableByStyler
	}).
	
	editorElement1 := BrEditorElement new.
	editorElement1 constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	editorElement1 editor: editor.

	space1 := BlSpace new.
	space1 extent: self extent.
	space1 root addChild: editorElement1.
	
	editorElement2 := BrEditorElement new.
	editorElement2 constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	editorElement2 editor: editor.

	space2 := BlSpace new.
	space2 extent: self extent.
	space2 root addChild: editorElement2.
	
	space1 show.
	space2 show
]

{ #category : #'examples - comparison' }
BrTextEditorExamples class >> exampleRubric [
	RubScrolledTextMorph new 
		setText: self loremIpsum;
		extent: self extent;
		beWrapped;
		openInWindow
]

{ #category : #examples }
BrTextEditorExamples class >> exampleTextOpen [
	| space editorElement |
	
	editorElement := (self >> #elementWithEditor) gtExample returnValue.
	editorElement editor text attributes: {
		BrFontSizeAttribute size: 18.
		BrFontFamilyAttribute named: 'Helvetica Neue'.
	}.
	editorElement constraintsDo: [ :c |
		c horizontal matchParent.
		c vertical matchParent ].
	
	space := BlSpace new.
	space root addChild: editorElement.
	space root addEventHandler:
			(BlEventHandler
				on: BlDoubleClickEvent
				do: [ :evt | BlElementSelection on: evt target ]).
	space show
]

{ #category : #'examples - comparison' }
BrTextEditorExamples class >> extent [
	^ 600@400
]

{ #category : #'examples - comparison' }
BrTextEditorExamples class >> loremIpsum [
	^ self loremIpsum: 1000000
]

{ #category : #'examples - comparison' }
BrTextEditorExamples class >> loremIpsum: aLength [
	loremIpsum ifNil: [ loremIpsum := Dictionary new ].
	^ loremIpsum
			at: aLength asString asSymbol
			ifAbsentPut: [ String loremIpsum: aLength ]
]

{ #category : #examples }
BrTextEditorExamples >> adormentDynamicAttribute [
	<gtExample>
	
	^ self newElement editor: self editorWithAdormentDynamicAttribute
]

{ #category : #examples }
BrTextEditorExamples >> editorWithAdormentDynamicAttribute [
	<gtExample>
	| editor text |
	text := self newThreeLineText.
	editor := self newEditor text: text.
	editor text
		attributes: { 
			BrTextAdornmentDynamicAttribute new 
				stencil: [ 
					BlElement new 
						size: 70 @ 50; 
						margin: (BlInsets all: 5);
						background: Color red ] }
		from: 1
		to: text size.
	^ editor
]

{ #category : #examples }
BrTextEditorExamples >> editorWithMethod [
	<gtExample>
	^ self newEditor text: self newMethodText
]

{ #category : #examples }
BrTextEditorExamples >> editorWithText [
	<gtExample>
	^ self newEditor text: self newText
]

{ #category : #examples }
BrTextEditorExamples >> elementOnMethodWithSyntaxHighlighting [
	<gtExample>
	| element styler text editor |
	text := self newMethodText.
	element := self newElement.
	editor := self newEditor.
	styler := BrRBTextStyler new.
	styler classOrMetaClass: Object.
	editor styler: styler.
	editor text: text.
	element editor: editor.
	^ element
]

{ #category : #examples }
BrTextEditorExamples >> elementWithEditor [
	<gtExample>
	
	^ self newElement editor: self editorWithText
]

{ #category : #examples }
BrTextEditorExamples >> elementWithEmptyEditor [
	<gtExample>
	
	^ self newElement editor: (self newEditor text: (' ' asRopedText fontSize: 16; monospace))
]

{ #category : #examples }
BrTextEditorExamples >> elementWithMethod [
	<gtExample>
	
	^ self newElement editor: self editorWithMethod
]

{ #category : #'instance creation' }
BrTextEditorExamples >> newEditor [
	<gtExample>

	^ BrTextEditor new
]

{ #category : #'instance creation' }
BrTextEditorExamples >> newElement [
	<gtExample>
	
	^ BrEditorElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical matchParent ];
		yourself
]

{ #category : #'instance creation' }
BrTextEditorExamples >> newMethodText [
	<gtExample>
	
	^ BlRopedText string: (Morph>>#fullDrawOn:) sourceCode
]

{ #category : #'instance creation' }
BrTextEditorExamples >> newText [
	<gtExample>
	
	^ BlRopedText string: (String loremIpsum: 2000000)
]

{ #category : #'instance creation' }
BrTextEditorExamples >> newThreeLineText [
	<gtExample>
	
	^ BlRopedText string: 'first', String cr, 'second', String cr, 'third'
]
