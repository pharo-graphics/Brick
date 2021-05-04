Class {
	#name : #BrMaterialListSingleLineItemAptitude,
	#superclass : #BrMaterialListItemAptitude,
	#category : #'Brick-Material-List'
}

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> compactHeight [
	^ 48
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> compactPadding [
	^ BlInsets top: 12 right: 16 bottom: 12 left: 16
]

{ #category : #initialization }
BrMaterialListSingleLineItemAptitude >> initialize [
	super initialize
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> largeHeight [
	^ 72
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> largePadding [
	^ BlInsets top: 8 right: 16 bottom: 8 left: 0
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> mediumHeight [
	^ 72
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> mediumPadding [
	^ BlInsets top: 8 right: 16 bottom: 8 left: 16
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> smallHeight [
	^ 56
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> smallPadding [
	^ BlInsets top: 8 right: 16 bottom: 8 left: 16
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> tinyHeight [
	^ 56
]

{ #category : #configuration }
BrMaterialListSingleLineItemAptitude >> tinyPadding [
	^ BlInsets top: 16 right: 16 bottom: 16 left: 16
]
