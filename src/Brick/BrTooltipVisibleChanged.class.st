Class {
	#name : #BrTooltipVisibleChanged,
	#superclass : #BrChangeEvent,
	#instVars : [
		'visible'
	],
	#category : #'Brick-Tooltip - Events'
}

{ #category : #accessing }
BrTooltipVisibleChanged >> visible [
	^ visible
]

{ #category : #accessing }
BrTooltipVisibleChanged >> visible: anObject [
	visible := anObject
]
