"
! Glamorous selectable tree row

Makes rows in the columned tree have selection, hover and press visual effects.
${example:BrGlamorousColumnedTreeSelectableRowElementStencilBuilder class>>#columnedTreeExample}$
"
Class {
	#name : #BrGlamorousColumnedTreeSelectableRowElementStencilBuilder,
	#superclass : #BrColumnedTreeRowElementStencilBuilder,
	#instVars : [
		'padding',
		'cellSpacing'
	],
	#category : #'Brick-Glamorous-List, Tree'
}

{ #category : #'api - instantiation' }
BrGlamorousColumnedTreeSelectableRowElementStencilBuilder >> buildDefault [
	^ super buildDefault
		addLook: BrGlamorousListItemLook;
		layoutDo: [ :aLayout | aLayout cellSpacing: self cellSpacing ];
		padding: self padding
]

{ #category : #accessing }
BrGlamorousColumnedTreeSelectableRowElementStencilBuilder >> cellSpacing [
	^ cellSpacing
]

{ #category : #accessing }
BrGlamorousColumnedTreeSelectableRowElementStencilBuilder >> cellSpacing: anObject [
	cellSpacing := anObject
]

{ #category : #initialization }
BrGlamorousColumnedTreeSelectableRowElementStencilBuilder >> initialize [
	super initialize.
	
	cellSpacing := 0.
	padding := BlInsets empty
]

{ #category : #accessing }
BrGlamorousColumnedTreeSelectableRowElementStencilBuilder >> padding [
	^ padding
]

{ #category : #accessing }
BrGlamorousColumnedTreeSelectableRowElementStencilBuilder >> padding: anObject [
	padding := anObject
]
