Class {
	#name : #BrPopupAptitude,
	#superclass : #BrInteractiveCommonAptitude,
	#instVars : [
		'popupTarget',
		'popupStencil',
		'resizerLook'
	],
	#category : #'Brick-Popup - Look'
}

{ #category : #private }
BrPopupAptitude >> closePopup [
	self widgetDo: [ :aWidget | self popupTarget closePopup: aWidget ]
]

{ #category : #private }
BrPopupAptitude >> ensureContent [
	self widgetContent
		childNamed: #popupContent
		ifFound: [ ^ self ]
		ifNone: [ self widgetContent addChild: popupStencil asElement as: #popupContent ].
	
	resizerLook requestStates
]

{ #category : #initialization }
BrPopupAptitude >> initialize [
	super initialize.

	popupTarget := BrPopupEmptyTarget new.
	popupStencil := [ BlElement new ] asStencil.

	self expanded: [ self openPopup ].
	self collapsed: [ self closePopup ].
	
	self add: (resizerLook := BrLayoutResizerAptitude inherit
		inherit: [ :aBlock | aBlock value: (self isAttachedToWidget
			ifTrue: [ self widgetContent childNamed: #popupContent ifFound: #yourself ifNone: [ BlElement new ] ]
			ifFalse: [ BlElement new ])])
]

{ #category : #initialization }
BrPopupAptitude >> initializeListeners [
	super initializeListeners.
	
	self when: BrPopupTargetChanged do: [ :anEvent | self popupTarget: anEvent popupTarget ].
	self when: BrPopupStencilChanged do: [ :anEvent | self popupStencil: anEvent popupStencil ]
]

{ #category : #initialization }
BrPopupAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrPopupTargetRequest new.
	self request: BrPopupStencilRequest new
]

{ #category : #private }
BrPopupAptitude >> openPopup [
	self ensureContent.
	self widgetDo: [ :aWidget |
		(aWidget isAttachedToSceneGraph not and: [ aWidget hasParent not ])
			ifTrue: [ self popupTarget openPopup: aWidget ] ]
]

{ #category : #accessing }
BrPopupAptitude >> popupStencil [
	^ popupStencil
]

{ #category : #accessing }
BrPopupAptitude >> popupStencil: aStencil [
	| isOpened |
	
	isOpened := (self request: BrExpansionStateRequest oneWay) isExpanded.
	self widgetDo: [ :aWidget | self widgetContent
		childNamed: #popupContent
		ifFound: #removeFromParent
		ifNone: [  ] ].
	
	popupStencil := aStencil.
	isOpened ifTrue: [ self ensureContent ]
]

{ #category : #accessing }
BrPopupAptitude >> popupTarget [
	<return: #BrPopupTarget>

	^ popupTarget
]

{ #category : #accessing }
BrPopupAptitude >> popupTarget: aPopupTarget [
	| isOpened |
	
	isOpened := (self request: BrExpansionStateRequest oneWay) isExpanded.
	isOpened ifTrue: [ self closePopup ].
	popupTarget := aPopupTarget.
	isOpened ifTrue: [ self openPopup ]
]
