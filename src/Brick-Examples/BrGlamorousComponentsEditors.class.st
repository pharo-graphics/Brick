Class {
	#name : #BrGlamorousComponentsEditors,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #examples }
BrGlamorousComponentsEditors >> basicEditor [
	<gtExample>

	^ BrEditor new
		look: BrGlamorousEditorLook;
		text: String loremIpsum
]

{ #category : #examples }
BrGlamorousComponentsEditors >> digitsOnly [
	<gtExample>

	^ BrEditor new
		look: BrGlamorousEditorLook + BrGlamorousInputFieldSpacingLook;
		inputFilter: BrTextEditorDigitInputFilter new;
		text: '42';
		fitContent
]

{ #category : #examples }
BrGlamorousComponentsEditors >> inputField [
	<gtExample>

	^ BrEditor new
		look: BrGlamorousEditorLook + BrGlamorousInputFieldSpacingLook;
		text: (String loremIpsum: 20) trimBoth;
		fitContent
]

{ #category : #examples }
BrGlamorousComponentsEditors >> textArea [
	<gtExample>

	^ BrEditor new
		look: BrGlamorousEditorLook + BrGlamorousTextAreaSpacingLook;
		text: String loremIpsum
]
