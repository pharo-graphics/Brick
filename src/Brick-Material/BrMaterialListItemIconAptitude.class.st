Class {
	#name : #BrMaterialListItemIconAptitude,
	#superclass : #BrIconAptitude,
	#instVars : [
		'size',
		'margin'
	],
	#category : #'Brick-Material-List'
}

{ #category : #'api - configuration' }
BrMaterialListItemIconAptitude >> beLarge [
	self size: self largeSize.
	self margin: self largeMargin
]

{ #category : #'api - configuration' }
BrMaterialListItemIconAptitude >> beMedium [
	self size: self mediumSize.
	self margin: self mediumMargin
]

{ #category : #'api - configuration' }
BrMaterialListItemIconAptitude >> beSmall [
	self size: self smallSize.
	self margin: self smallMargin
]

{ #category : #'api - configuration' }
BrMaterialListItemIconAptitude >> beTiny [
	self size: self tinySize.
	self margin: self tinyMargin
]

{ #category : #initialization }
BrMaterialListItemIconAptitude >> initialize [
	super initialize.
	
	self beTiny
]

{ #category : #configuration }
BrMaterialListItemIconAptitude >> largeMargin [
	"Return the margin to be used for the large (100x56) version of the icon"
	<return: #BlInsets>

	^ BlInsets right: 16
]

{ #category : #configuration }
BrMaterialListItemIconAptitude >> largeSize [
	^ 100@56
]

{ #category : #accessing }
BrMaterialListItemIconAptitude >> margin [
	^ margin
]

{ #category : #accessing }
BrMaterialListItemIconAptitude >> margin: anObject [
	margin := anObject
]

{ #category : #configuration }
BrMaterialListItemIconAptitude >> mediumMargin [
	"Return the margin to be used for the medium (56x56) version of the icon"
	<return: #BlInsets>

	^ BlInsets right: 16
]

{ #category : #configuration }
BrMaterialListItemIconAptitude >> mediumSize [
	^ 56@56
]

{ #category : #accessing }
BrMaterialListItemIconAptitude >> size [
	^ size
]

{ #category : #accessing }
BrMaterialListItemIconAptitude >> size: anObject [
	size := anObject
]

{ #category : #configuration }
BrMaterialListItemIconAptitude >> smallMargin [
	"Return the margin to be used for the small (40x40) version of the icon"
	<return: #BlInsets>

	^ BlInsets right: 16
]

{ #category : #configuration }
BrMaterialListItemIconAptitude >> smallSize [
	^ 40@40
]

{ #category : #configuration }
BrMaterialListItemIconAptitude >> tinyMargin [
	"Return the margin to be used for the tiny (24x24) version of the icon"
	<return: #BlInsets>

	^ BlInsets right: 32
]

{ #category : #configuration }
BrMaterialListItemIconAptitude >> tinySize [
	^ 24@24
]

{ #category : #updating }
BrMaterialListItemIconAptitude >> updateIcon [
	super updateIcon.
	
	self iconDo: [ :anElement |
		anElement
			size: self size;
			margin: self margin ]
]
