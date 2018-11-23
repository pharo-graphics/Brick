Class {
	#name : #BrCardExamples,
	#superclass : #Object,
	#category : #'Brick-Examples-Card'
}

{ #category : #card }
BrCardExamples >> cardElement [
	<gtExample>
	| anElement |
	anElement := BrCard new.
	self assert: anElement action notNil.
	self assert: anElement picture notNil.
	self assert: anElement description notNil.
	^ anElement
]

{ #category : #card }
BrCardExamples >> verticalCard [
	<gtExample>
	| anElement aTitleElement aPictureElement aDescriptionElement |
	anElement := self cardElement.
	anElement 
		size: 150@200;
		look: BrShadowLook + BrTextLabelLook + BrIconLook + BrDescriptionLook + BrGlamorousWithVerticalResizerLook + BrGlamorousWithHorizontalResizerLook;
		background: Color white;
		margin: (BlInsets all: 10);
		padding: (BlInsets all: 10);
		layout: BlLinearLayout vertical;
		title: ('GToolkit in Pharo' asRopedText bold);
		description: ((String loremIpsum: 200) asRopedText 
			foreground: Color gray; fontSize: 10; readonly);
		picture: PolymorphSystemSettings pharoLogoForm asElement asPannableElement;
		action: [ :e | self inform: 'Hey! I am a card' ].
	aTitleElement := anElement childNamed: #label.
	aPictureElement := anElement childNamed: #icon.
	aDescriptionElement := anElement childNamed: #description.
	aDescriptionElement look: (BrLayoutLook matchParent).
	
	^ anElement
]
