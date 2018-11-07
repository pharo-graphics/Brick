Class {
	#name : #BrTextExpandButtonAttributeStencil,
	#superclass : #BrStencil,
	#instVars : [
		'isExpanded',
		'attributesCreatingBlock',
		'shouldAppend',
		'isOverwritableByStyler'
	],
	#category : #'Brick-Editor-Text-Attributes'
}

{ #category : #accessing }
BrTextExpandButtonAttributeStencil >> attributesCreatingBlock [
	^ attributesCreatingBlock
]

{ #category : #accessing }
BrTextExpandButtonAttributeStencil >> attributesCreatingBlock: anObject [
	attributesCreatingBlock := anObject
]

{ #category : #accessing }
BrTextExpandButtonAttributeStencil >> beAppend [
	shouldAppend := true
]

{ #category : #accessing }
BrTextExpandButtonAttributeStencil >> beNotOverwritableByStyler [
	isOverwritableByStyler := false
]

{ #category : #accessing }
BrTextExpandButtonAttributeStencil >> beOverwritableByStyler [
	isOverwritableByStyler := true
]

{ #category : #accessing }
BrTextExpandButtonAttributeStencil >> beReplace [
	shouldAppend := false
]

{ #category : #private }
BrTextExpandButtonAttributeStencil >> collapsedTextExpandButtonAttribute [
	^ BrTextExpandButtonAttribute new
			attributesCreatingBlock: self attributesCreatingBlock.
]

{ #category : #'api - instantiation' }
BrTextExpandButtonAttributeStencil >> create [
	<return: #Array of: #BlTextAttribute>

	^ self isExpanded
		ifTrue: [ self expandedTextExpandButtonAndPreviewAttributes ]
		ifFalse: [ Array with: self collapsedTextExpandButtonAttribute ]
]

{ #category : #private }
BrTextExpandButtonAttributeStencil >> expandedTextExpandButtonAndPreviewAttributes [
	| anExpandingAttribute aPreviewAttributes |
	aPreviewAttributes := self attributesCreatingBlock value.
	anExpandingAttribute := self collapsedTextExpandButtonAttribute
		isExpanded: true;
		createdAttributes: aPreviewAttributes.
	^ Array with: anExpandingAttribute withAll: aPreviewAttributes
]

{ #category : #initialization }
BrTextExpandButtonAttributeStencil >> initialize [
	super initialize.
	attributesCreatingBlock := [ OrderedCollection new ].
	isExpanded := false.
	shouldAppend := true.
	isOverwritableByStyler := false.
]

{ #category : #accessing }
BrTextExpandButtonAttributeStencil >> isExpanded [
	^ isExpanded
]

{ #category : #accessing }
BrTextExpandButtonAttributeStencil >> isExpanded: anObject [
	isExpanded := anObject
]
