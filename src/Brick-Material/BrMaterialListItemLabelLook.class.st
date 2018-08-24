Class {
	#name : #BrMaterialListItemLabelLook,
	#superclass : #BrLabelLook,
	#category : 'Brick-Material-List'
}

{ #category : #initialization }
BrMaterialListItemLabelLook >> initialize [
	super initialize.
	
	self fontSize: 16.
	self fontName: 'Roboto'
]

{ #category : #initialization }
BrMaterialListItemLabelLook >> initializeLook [
	super initializeLook.

	self labelDo: [ :anElement | anElement constraintsDo: [ :c | c horizontal matchParent ] ]
]
