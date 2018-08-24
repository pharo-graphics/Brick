Class {
	#name : #BrMaterialListItemStencil,
	#superclass : #BrStencil,
	#instVars : [
		'looks',
		'text',
		'icon'
	],
	#category : 'Brick-Material-Stencils'
}

{ #category : #'instance creation' }
BrMaterialListItemStencil class >> singleLineWithLargeIcon [
	^ self new looks: [ {
		BrMaterialListSingleLineItemLook new beLarge.
		BrMaterialListItemIconLook new beLarge.
		BrMaterialListItemLabelLook new } ]
]

{ #category : #'instance creation' }
BrMaterialListItemStencil class >> singleLineWithMediumIcon [
	^ self new looks: [ {
		BrMaterialListSingleLineItemLook new beMedium.
		BrMaterialListItemIconLook new beMedium.
		BrMaterialListItemLabelLook new } ]
]

{ #category : #'instance creation' }
BrMaterialListItemStencil class >> singleLineWithSmallIcon [
	^ self new looks: [ {
		BrMaterialListSingleLineItemLook new beSmall.
		BrMaterialListItemIconLook new beSmall.
		BrMaterialListItemLabelLook new } ]
]

{ #category : #'instance creation' }
BrMaterialListItemStencil class >> singleLineWithTinyIcon [
	^ self new looks: [ {
		BrMaterialListSingleLineItemLook new beTiny.
		BrMaterialListItemIconLook new beTiny.
		BrMaterialListItemLabelLook new } ]
]

{ #category : #'instance creation' }
BrMaterialListItemStencil class >> singleLineWithoutIcon [
	^ self new looks: [ {
		BrMaterialListSingleLineItemLook new beCompact.
		BrMaterialListItemLabelLook new } ]
]

{ #category : #'instance creation' }
BrMaterialListItemStencil >> create [
	^ BrButton new
		label: self text;
		icon: self icon;
		look: (BrLook new addAll: self looks)
]

{ #category : #accessing }
BrMaterialListItemStencil >> icon [
	^ icon value
]

{ #category : #accessing }
BrMaterialListItemStencil >> icon: anObject [
	icon := anObject
]

{ #category : #initialization }
BrMaterialListItemStencil >> initialize [
	super initialize.
	
	text := 'Single-line item'.
	icon := [ BlElement new ].
	looks := [ {  } ]
]

{ #category : #accessing }
BrMaterialListItemStencil >> label: aStringOrText [
	self text: aStringOrText
]

{ #category : #accessing }
BrMaterialListItemStencil >> looks [
	^ looks value
]

{ #category : #accessing }
BrMaterialListItemStencil >> looks: anObject [
	looks := anObject
]

{ #category : #accessing }
BrMaterialListItemStencil >> text [
	^ text
]

{ #category : #accessing }
BrMaterialListItemStencil >> text: aStringOrText [
	text := aStringOrText
]
