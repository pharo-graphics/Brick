Class {
	#name : #BrPopupLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'popupTarget'
	],
	#category : #'Brick-Popup - Look'
}

{ #category : #private }
BrPopupLook >> ensureContent [
]

{ #category : #initialization }
BrPopupLook >> initialize [
	super initialize.

	popupTarget := BrPopupEmptyTarget new.

	self expanded: [ :aWidget |
		self ensureContent.
		self popupTarget openPopup: aWidget ].
	self collapsed: [ :aWidget | self popupTarget closePopup: aWidget ]
]

{ #category : #initialization }
BrPopupLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrPopupTargetRequest new
]

{ #category : #accessing }
BrPopupLook >> popupTarget [
	<return: #BrPopupTarget>

	^ popupTarget
]

{ #category : #accessing }
BrPopupLook >> popupTarget: aPopupTarget [
	| isOpened |
	
	isOpened := (self request: BrExpansionStateRequest oneWay) isExpanded.
	isOpened ifTrue: [ self widgetDo: [ :aWidget | self popupTarget closePopup: aWidget ] ].
	popupTarget := aPopupTarget.
	isOpened ifTrue: [ self widgetDo: [ :aWidget | self popupTarget openPopup: aWidget ] ]
]
