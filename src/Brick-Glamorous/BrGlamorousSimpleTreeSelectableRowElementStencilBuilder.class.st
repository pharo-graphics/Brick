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

{ #category : #'api - instantiation' }
BrGlamorousSimpleTreeSelectableRowElementStencilBuilder >> buildDefault [
	^ super buildDefault
		addAptitude: BrGlamorousListItemAptitude;
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
