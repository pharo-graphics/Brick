"
! Glamorous selectable tree row

Makes rows in the simple tree have selection, hover and press visual effects.
${example:BrGlamorousSimpleTreeSelectableRowElementStencilBuilder class>>#simpleTreeExample}$
"
Class {
	#name : #BrGlamorousSimpleTreeSelectableRowElementStencilBuilder,
	#superclass : #BrSimpleTreeRowElementStencilBuilder,
	#instVars : [
		'cellSpacing',
		'padding'
	],
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #examples }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder class >> simpleTreeExample [
	<gtExample>
	
	^ BrSimpleTreeExamples new subclassesOfCollection
		rowStencil: (BrGlamorousSimpleTreeSelectableRowElementStencilBuilder new
			"adds a bit of space to the left from the expander triangle"
			padding: (BlInsets left: 5));
		expandUpTo: 2
]

{ #category : #'api - instantiation' }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder >> buildDefault [
	^ super buildDefault
		addLook: BrGlamorousListItemLook;
		layoutDo: [ :aLayout | aLayout cellSpacing: self cellSpacing ];
		padding: self padding
]

{ #category : #accessing }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder >> cellSpacing [
	^ cellSpacing
]

{ #category : #accessing }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder >> cellSpacing: anObject [
	cellSpacing := anObject
]

{ #category : #accessing }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder >> initialize [
	super initialize.
	
	cellSpacing := 0.
	padding := BlInsets empty
]

{ #category : #accessing }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder >> padding [
	^ padding
]

{ #category : #accessing }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder >> padding: anObject [
	padding := anObject
]
