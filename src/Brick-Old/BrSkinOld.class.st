Class {
	#name : #BrSkinOld,
	#superclass : #BlElementEventListener,
	#instVars : [
		'widget',
		'controller'
	],
	#category : 'Brick-Old'
}

{ #category : #'change reporting' }
BrSkinOld >> backgroundChanged [
	widget background: widget backgroundColor
]

{ #category : #'focus handlers' }
BrSkinOld >> blurEvent: anEvent [
	controller onBlur: anEvent.
]

{ #category : #'change reporting' }
BrSkinOld >> borderChanged [
	widget border: (BlBorder
			paint: widget borderColor
			width: widget borderWidth)
]

{ #category : #accessing }
BrSkinOld >> children [
	^  widget children 
]

{ #category : #accessing }
BrSkinOld >> controller [
	^   controller
]

{ #category : #initialization }
BrSkinOld >> defaultChildren [
	^ BlChildrenArray new
]

{ #category : #initialization }
BrSkinOld >> defaultLayout [
	^ widget defaultLayout
]

{ #category : #'focus handlers' }
BrSkinOld >> focusEvent: anEvent [
	controller onFocus: anEvent.
]

{ #category : #initialization }
BrSkinOld >> initializeSkin [
	widget borderColorProperty onChangedDo: [ self borderChanged ].
	widget borderWidthProperty onChangedDo: [ self borderChanged ].
	widget backgroundColorProperty onChangedDo: [ self backgroundChanged ]
]

{ #category : #'mouse handlers' }
BrSkinOld >> mouseDownEvent: anEvent [
	controller onMouseDown: anEvent.
]

{ #category : #'mouse handlers' }
BrSkinOld >> mouseEnterEvent: anEvent [
	controller onMouseEnter: anEvent
]

{ #category : #'mouse handlers' }
BrSkinOld >> mouseLeaveEvent: anEvent [
	controller onMouseLeave: anEvent
]

{ #category : #'mouse handlers' }
BrSkinOld >> mouseUpEvent: anEvent [
	controller onMouseUp: anEvent.

]

{ #category : #installation }
BrSkinOld >> onInstalledIn: aWidget [
	super onInstalledIn: aWidget.
	
	widget := aWidget.
	controller := widget controller.
	widget layout: self defaultLayout.

	self initializeSkin.
	self updateChildren
]

{ #category : #updating }
BrSkinOld >> updateChildren [
]

{ #category : #events }
BrSkinOld >> wantsEvent: anEvent [
	^ controller wantsEvent: anEvent
]
