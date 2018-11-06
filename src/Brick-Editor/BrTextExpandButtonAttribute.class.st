"
I am a text attribute that adds a small expand button that when clicked may apply further attribues on the text
"
Class {
	#name : #BrTextExpandButtonAttribute,
	#superclass : #BrTextAdornmentAttribute,
	#instVars : [
		'isExpanded',
		'attributesCreatingBlock',
		'createdAttributes'
	],
	#category : 'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextExpandButtonAttribute >> affect: aBrText in: anEditorElement [
	| aTextEditor |

	aTextEditor := anEditorElement editor.

	^ BlElement new
		size: 8@11;
		margin: (BlInsets top: 2 right: 5 bottom: 0 left: 5);
		background: (Color gray alpha: 0.4);
		geometry: (BlPolygon vertices: (isExpanded 	
			ifTrue: [ { 0@3 . 8@3. 4@11 } ] 
			ifFalse: [ { 0@3 . 8@7. 0@11 } ]));
		addEventHandlerOn: BlClickEvent do: [ :anEvent | 
			isExpanded
				ifTrue: [ 
					aBrText clearAttributes: [ :aTextAttribute | createdAttributes includes: aTextAttribute ] ]
				ifFalse: [ 
					createdAttributes := (attributesCreatingBlock cull: aBrText cull: aTextEditor) asOrderedCollection.
					aBrText attributes: createdAttributes ].
			self isExpanded: isExpanded not.
			aTextEditor invalidate: aBrText start to: aBrText end.
			aTextEditor update: aBrText start to: aBrText end ];
		yourself
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> attributesCreatingBlock [
	^ attributesCreatingBlock
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> attributesCreatingBlock: aBlock [
	attributesCreatingBlock := aBlock
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> createdAttributes [
	^ createdAttributes
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> createdAttributes: anObject [
	createdAttributes := anObject
]

{ #category : #initialization }
BrTextExpandButtonAttribute >> initialize [
	super initialize.
	
	self beAppend.
	
	attributesCreatingBlock := [ OrderedCollection new ].
	isExpanded := false.
	createdAttributes := OrderedCollection new
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> isExpanded [
	^ isExpanded
]

{ #category : #accessing }
BrTextExpandButtonAttribute >> isExpanded: aBoolean [
	isExpanded := aBoolean
]
