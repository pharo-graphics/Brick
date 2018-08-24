Class {
	#name : #BrMaterialListSingleLineItemLook,
	#superclass : #BrMaterialListItemLook,
	#category : 'Brick-Material-List'
}

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> compactHeight [
	^ 48
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> compactPadding [
	^ BlInsets top: 12 right: 16 bottom: 12 left: 16
]

{ #category : #initialization }
BrMaterialListSingleLineItemLook >> initialize [
	super initialize
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> largeHeight [
	^ 72
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> largePadding [
	^ BlInsets top: 8 right: 16 bottom: 8 left: 0
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> mediumHeight [
	^ 72
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> mediumPadding [
	^ BlInsets top: 8 right: 16 bottom: 8 left: 16
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> smallHeight [
	^ 56
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> smallPadding [
	^ BlInsets top: 8 right: 16 bottom: 8 left: 16
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> tinyHeight [
	^ 56
]

{ #category : #configuration }
BrMaterialListSingleLineItemLook >> tinyPadding [
	^ BlInsets top: 16 right: 16 bottom: 16 left: 16
]
