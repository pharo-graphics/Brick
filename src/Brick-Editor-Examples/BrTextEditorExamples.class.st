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
	#category : #'Brick-Editor-Examples'
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
		(BlFontSizeAttribute size: 18) beNotOverwritableByStyler.
		BlFontGenericFamilyAttribute monospace beNotOverwritableByStyler
	}.
	editorElement editor text attributes: {
		BrTextHoverStylableAttribute new beNotOverwritableByStyler.
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
		BlFontSizeAttribute size: 18.
		BlFontGenericFamilyAttribute monospace
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

{ #category : #examples }
BrTextEditorExamples class >> exampleTextOpen [
	| space editorElement |
	
	editorElement := (self >> #elementWithEditor) gtExample returnValue.
	editorElement editor text attributes: {
		BlFontSizeAttribute size: 18.
		BlFontFamilyAttribute named: 'Helvetica Neue'.
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

{ #category : #'examples - editing' }
BrTextEditorExamples >> brickString [
	<gtExample>
	^ 'Brick'
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
BrTextEditorExamples >> editorWithAdormentDynamicAttributeReturningEmptyCollection [
	<gtExample>
	| editor text |
	text := self newThreeLineText.
	editor := self newEditor text: text.
	editor text
		attributes: { 
			BrTextAdornmentDynamicAttribute new 
				stencil: [ #() ] }
		from: 1
		to: text size.
	^ editor
]

{ #category : #examples }
BrTextEditorExamples >> editorWithAdormentDynamicAttributeReturningTwoElements [
	<gtExample>
	| editor text |
	text := self newThreeLineText.
	editor := self newEditor text: text.
	editor text
		attributes: { 
			BrTextAdornmentDynamicAttribute new 
				stencil: [ 
					{ BlElement new 
						size: 70 @ 50; 
						margin: (BlInsets all: 5);
						background: Color red.
					BlElement new 
						size: 70 @ 50; 
						margin: (BlInsets all: 5);
						background: Color green } ] }
		from: 1
		to: text size.
	^ editor
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> editorWithBrickText [
	<gtExample>
	| anEditor aText |
	anEditor := self newEditor.
	aText := self brickString asRopedText.
	anEditor text: aText.
	self assert: anEditor text equals: aText.
	^ anEditor
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> editorWithLastHiddenCharacter [
	<gtExample>
	| anEditor |
	anEditor := self editorWithBrickText.
	(anEditor text from: anEditor text size to: anEditor text size)
		attribute: self newBeReplaceTextAttribute.
	self assert: anEditor text asString equals: self brickString.
	^ anEditor
]

{ #category : #'examples - editor' }
BrTextEditorExamples >> editorWithMethod [
	<gtExample>
	^ self newEditor text: self newMethodText
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> editorWithSecondHiddenCharacter [
	<gtExample>
	| anEditor |
	anEditor := self editorWithBrickText.
	(anEditor text from: 2 to: 2)
		attribute: self newBeReplaceTextAttribute.
	self assert: anEditor text asString equals: self brickString.
	^ anEditor
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
BrTextEditorExamples >> fullDrawOn: aCanvas [
	"Draw the full Morphic structure on the given Canvas"

	self visible ifFalse: [^ self].
	(aCanvas isVisible: self fullBounds) ifFalse:[^self].
	
	(self hasProperty: #errorOnDraw) ifTrue:[^self drawErrorOn: aCanvas].
	
	[
		"Note: At some point we should generalize this into some sort of 
		multi-canvas so that we can cross-optimize some drawing operations."
		"Pass 1: Draw eventual drop-shadow"
		self hasDropShadow ifTrue: [ self drawDropShadowOn: aCanvas ].

		"Pass 2: Draw receiver itself"
		
		aCanvas roundCornersOf: self during:[
			(aCanvas isVisible: self bounds) ifTrue:[aCanvas drawMorph: self].
			self drawSubmorphsOn: aCanvas.
			self drawDropHighlightOn: aCanvas.
			self drawMouseDownHighlightOn: aCanvas]
		
	] on: Error do: [:err |
		self setProperty: #errorOnDraw toValue: true.
		self setProperty: #drawError toValue: err freeze.
		^ self drawErrorOn: aCanvas
	]
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> insertAStringAfterLastHiddenCharacter [
	<gtExample>
	| anEditor |
	anEditor := self editorWithLastHiddenCharacter.
	anEditor insertString: '_' at: anEditor text size.
	self assert: anEditor text asString equals: self brickString, '_'.
	^ anEditor
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> insertAStringAfterSecondHiddenCharacter [
	<gtExample>
	| anEditor |
	anEditor := self editorWithSecondHiddenCharacter.
	anEditor insertString: '_' at: 2.
	self assert: anEditor text asString equals: 'Br_ick'.
	^ anEditor
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> insertLineFeedString [
	<gtExample>
	| anEditor |
	anEditor := self editorWithBrickText.
	anEditor insertString: String lf at: anEditor text size.
	self assert: anEditor text asString equals: self brickString, String lf.
	^ anEditor
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> insertLineFeedStringAfterLastHiddenCharacter [
	<gtExample>
	| anEditor |
	anEditor := self editorWithLastHiddenCharacter.
	anEditor insertString: String lf at: anEditor text size.
	self assert: anEditor text asString equals: self brickString, String lf.
	^ anEditor
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> insertLineFeedStringAfterSecondHiddenCharacter [
	<gtExample>
	| anEditor |
	anEditor := self editorWithSecondHiddenCharacter.
	anEditor insertString: String lf at: 2.
	self assert: anEditor text asString equals: 'Br', String lf, 'ick'.
	^ anEditor
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> insertLineFeedStringBeforeSecondHiddenCharacter [
	<gtExample>
	| anEditor |
	anEditor := self editorWithSecondHiddenCharacter.
	anEditor insertString: String lf at: 1.
	self assert: anEditor text asString equals: 'B', String lf, 'rick'.
	^ anEditor
]

{ #category : #'examples - editing' }
BrTextEditorExamples >> newBeReplaceTextAttribute [
	<gtExample>
	^ BrTextAdornmentDynamicAttribute new
		beReplace;
		stencil: [ BlElement new 
			size: 10@10; 
			background: Color lightGray ]
]

{ #category : #'instance creation' }
BrTextEditorExamples >> newEditor [
	<gtExample>

	^ BrTextEditor new beLineBased
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
	
	^ BlRopedText string: (BrTextEditorExamples>>#fullDrawOn:) sourceCode
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
