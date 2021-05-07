Class {
	#name : #BrGlamorousComponentsEditors,
	#superclass : #BrGlamorousComponents,
	#category : #'Brick-Examples-! Glamorous components'
}

{ #category : #examples }
BrGlamorousComponentsEditors >> basicEditor [
	<gtExample>

	^ BrEditor new
		aptitude: BrGlamorousEditorAptitude;
		text: String loremIpsum
]

{ #category : #examples }
BrGlamorousComponentsEditors >> digitsOnly [
	<gtExample>

	^ BrEditor new
		aptitude: BrGlamorousEditorAptitude + BrGlamorousInputFieldSpacingAptitude;
		inputFilter: BrTextEditorDigitInputFilter new;
		text: '42';
		fitContent
]

{ #category : #examples }
BrGlamorousComponentsEditors >> inputField [
	<gtExample>

	^ BrEditor new
		aptitude: BrGlamorousEditorAptitude + BrGlamorousInputFieldSpacingAptitude;
		text: (String loremIpsum: 20) trimBoth;
		fitContent
]

{ #category : #examples }
BrGlamorousComponentsEditors >> textArea [
	<gtExample>

	^ BrEditor new
		aptitude: BrGlamorousEditorAptitude + BrGlamorousTextAreaSpacingAptitude;
		text: String loremIpsum
]
