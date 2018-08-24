Class {
	#name : #BrMaterialListItemIconLook,
	#superclass : #BrIconLook,
	#instVars : [
		'size',
		'margin'
	],
	#category : 'Brick-Material-List'
}

{ #category : #'api - configuration' }
BrMaterialListItemIconLook >> beLarge [
	self size: self largeSize.
	self margin: self largeMargin
]

{ #category : #'api - configuration' }
BrMaterialListItemIconLook >> beMedium [
	self size: self mediumSize.
	self margin: self mediumMargin
]

{ #category : #'api - configuration' }
BrMaterialListItemIconLook >> beSmall [
	self size: self smallSize.
	self margin: self smallMargin
]

{ #category : #'api - configuration' }
BrMaterialListItemIconLook >> beTiny [
	self size: self tinySize.
	self margin: self tinyMargin
]

{ #category : #initialization }
BrMaterialListItemIconLook >> initialize [
	super initialize.
	
	self beTiny
]

{ #category : #configuration }
BrMaterialListItemIconLook >> largeMargin [
	"Return the margin to be used for the large (100x56) version of the icon"
	<return: #BlInsets>

	^ BlInsets right: 16
]

{ #category : #configuration }
BrMaterialListItemIconLook >> largeSize [
	^ 100@56
]

{ #category : #accessing }
BrMaterialListItemIconLook >> margin [
	^ margin
]

{ #category : #accessing }
BrMaterialListItemIconLook >> margin: anObject [
	margin := anObject
]

{ #category : #configuration }
BrMaterialListItemIconLook >> mediumMargin [
	"Return the margin to be used for the medium (56x56) version of the icon"
	<return: #BlInsets>

	^ BlInsets right: 16
]

{ #category : #configuration }
BrMaterialListItemIconLook >> mediumSize [
	^ 56@56
]

{ #category : #accessing }
BrMaterialListItemIconLook >> size [
	^ size
]

{ #category : #accessing }
BrMaterialListItemIconLook >> size: anObject [
	size := anObject
]

{ #category : #configuration }
BrMaterialListItemIconLook >> smallMargin [
	"Return the margin to be used for the small (40x40) version of the icon"
	<return: #BlInsets>

	^ BlInsets right: 16
]

{ #category : #configuration }
BrMaterialListItemIconLook >> smallSize [
	^ 40@40
]

{ #category : #configuration }
BrMaterialListItemIconLook >> tinyMargin [
	"Return the margin to be used for the tiny (24x24) version of the icon"
	<return: #BlInsets>

	^ BlInsets right: 32
]

{ #category : #configuration }
BrMaterialListItemIconLook >> tinySize [
	^ 24@24
]

{ #category : #updating }
BrMaterialListItemIconLook >> updateIcon [
	super updateIcon.
	
	self iconDo: [ :anElement |
		anElement
			size: self size;
			margin: self margin ]
]
