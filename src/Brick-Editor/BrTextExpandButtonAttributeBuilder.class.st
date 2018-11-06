Class {
	#name : #BrTextExpandButtonAttributeBuilder,
	#superclass : #Object,
	#instVars : [
		'isExpanded',
		'attributesCreatingBlock',
		'shouldAppend',
		'isOverwritableByStyler'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextExpandButtonAttributeBuilder >> attributesCreatingBlock [
	^ attributesCreatingBlock
]

{ #category : #accessing }
BrTextExpandButtonAttributeBuilder >> attributesCreatingBlock: anObject [
	attributesCreatingBlock := anObject
]

{ #category : #accessing }
BrTextExpandButtonAttributeBuilder >> beAppend [
	shouldAppend := true
]

{ #category : #accessing }
BrTextExpandButtonAttributeBuilder >> beNotOverwritableByStyler [
	isOverwritableByStyler := false
]

{ #category : #accessing }
BrTextExpandButtonAttributeBuilder >> beOverwritableByStyler [
	isOverwritableByStyler := true
]

{ #category : #accessing }
BrTextExpandButtonAttributeBuilder >> beReplace [
	shouldAppend := false
]

{ #category : #'api - instantiation' }
BrTextExpandButtonAttributeBuilder >> build [
	<return: #Array of: #BlTextAttribute>

	^ self isExpanded
		ifTrue: [ self expandedTextExpandButtonAndPreviewAttributes ]
		ifFalse: [ Array with: self collapsedTextExpandButtonAttribute ]
]

{ #category : #private }
BrTextExpandButtonAttributeBuilder >> collapsedTextExpandButtonAttribute [
	^ BrTextExpandButtonAttribute new
			attributesCreatingBlock: self attributesCreatingBlock.
]

{ #category : #private }
BrTextExpandButtonAttributeBuilder >> expandedTextExpandButtonAndPreviewAttributes [
	| anExpandingAttribute aPreviewAttributes |
	aPreviewAttributes := self attributesCreatingBlock value.
	anExpandingAttribute := self collapsedTextExpandButtonAttribute
		isExpanded: true;
		createdAttributes: aPreviewAttributes.
	^ Array with: anExpandingAttribute withAll: aPreviewAttributes
]

{ #category : #initialization }
BrTextExpandButtonAttributeBuilder >> initialize [
	super initialize.
	attributesCreatingBlock := [ OrderedCollection new ].
	isExpanded := false.
	shouldAppend := true.
	isOverwritableByStyler := false.
]

{ #category : #accessing }
BrTextExpandButtonAttributeBuilder >> isExpanded [
	^ isExpanded
]

{ #category : #accessing }
BrTextExpandButtonAttributeBuilder >> isExpanded: anObject [
	isExpanded := anObject
]
