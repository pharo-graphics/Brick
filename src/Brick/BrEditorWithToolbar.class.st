"
I am a text editor with a toolbar to change visual properties of the text
"
Class {
	#name : #BrEditorWithToolbar,
	#superclass : #BrVerticalPane,
	#instVars : [
		'toolbar',
		'editor'
	],
	#category : #'Brick-Editor - UI'
}

{ #category : #private }
BrEditorWithToolbar >> addAttribute: anAttribute [
	editor selection do: [ :eachMonotoneSelection | (editor text from: eachMonotoneSelection from + 1 to: eachMonotoneSelection to) attribute: anAttribute ]
]

{ #category : #initialization }
BrEditorWithToolbar >> initialize [
	super initialize.
	
	toolbar := BrToolbar new.
	toolbar look: BrGlamorousToolbarLook horizontal.
	editor := BrEditor new.
	editor text: ((String loremIpsum: 100) shuffled trimBoth, String crlf, (String loremIpsum: 250) shuffled trimBoth) asRopedText.
	editor look: BrEditorLook + BrGlamorousTextAreaSpacingLook.
	
	toolbar addItem: (BrButton new
		look: BrGlamorousButtonWithIconLook new;
		icon: (BlTextElement new text: 'B' asRopedText) asScalableElement;
		label: 'Bold';
		action: [ self addAttribute: BlFontWeightAttribute bold ]).

	toolbar addItem: (BrButton new
		look: BrGlamorousButtonWithIconLook new;
		icon: (BlTextElement new text: 'I' asRopedText) asScalableElement;
		label: 'Italic';
		action: [ self addAttribute: BlFontEmphasisAttribute italic ]).

	toolbar addItem: (BrButton new
		look: BrGlamorousButtonWithIconLook new;
		icon: (BlTextElement new text: 'U' asRopedText) asScalableElement;
		label: 'Underline';
		action: [ self addAttribute: BlTextUnderlineAttribute new ]).
		
	toolbar addItem: (BrButton new
		look: BrGlamorousButtonWithIconLook new;
		icon: (BlTextElement new text: 'A' asRopedText) asScalableElement;
		label: 'Append';
		action: [ self addAttribute: (BrTextAdornmentDynamicAttribute new
			beAppend;
			stencil: [ BlElement new size: 10@10; geometry: BlCircle new; background: BrGlamorousColors primaryBorderColor ] ) ]).
		
	toolbar addItem: (BrButton new
		look: BrGlamorousButtonWithIconLook new;
		icon: (BlTextElement new text: 'R' asRopedText) asScalableElement;
		label: 'Replace';
		action: [ self addAttribute: (BrTextAdornmentDynamicAttribute new
			beReplace;
			stencil: [ BlElement new size: 10@10; geometry: BlCircle new; background: BrGlamorousColors darkBorderColor ] ) ]).

	self addLook: (BrLayoutResizerLook new
		hInherit: toolbar;
		vAnyToFitContent: toolbar;
		inherit: editor).

	self addChildren: { toolbar . editor }
]
