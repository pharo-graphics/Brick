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
		aptitude: BrShadowAptitude + BrTextLabelAptitude + BrIconAptitude + BrDescriptionAptitude + BrGlamorousWithVerticalResizerAptitude + BrGlamorousWithHorizontalResizerAptitude;
		background: Color white;
		margin: (BlInsets all: 10);
		padding: (BlInsets all: 10);
		layout: BlLinearLayout vertical;
		title: ('GToolkit in Pharo' asRopedText bold);
		description: ((String loremIpsum: 200) asRopedText 
			foreground: Color gray; fontSize: 10; readonly);
		picture: ((BlElement new background: Color lightGray; size: (361@121)) asPannableElement);
		action: [ :aBrCard | self inform: 'Hey! I am a card' ].
	aTitleElement := anElement childNamed: #label.
	aPictureElement := anElement childNamed: #icon.
	aDescriptionElement := anElement childNamed: #description.
	self assert: aTitleElement notNil.
	self assert: aPictureElement notNil.
	self assert: aDescriptionElement notNil.
	
	^ anElement
]
