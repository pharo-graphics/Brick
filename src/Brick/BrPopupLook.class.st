Class {
	#name : #BrPopupLook,
	#superclass : #BrInteractiveCommonLook,
	#instVars : [
		'popupTarget',
		'popupStencil',
		'resizerLook'
	],
	#category : #'Brick-Popup - Look'
}

{ #category : #private }
BrPopupLook >> closePopup [
	self widgetDo: [ :aWidget | self popupTarget closePopup: aWidget ]
]

{ #category : #private }
BrPopupLook >> ensureContent [
	self widgetContent
		childNamed: #popupContent
		ifFound: [ ^ self ]
		ifNone: [ self widgetContent addChild: popupStencil asElement as: #popupContent ].
	
	resizerLook requestStates
]

{ #category : #initialization }
BrPopupLook >> initialize [
	super initialize.

	popupTarget := BrPopupEmptyTarget new.
	popupStencil := [ BlElement new ] asStencil.

	self expanded: [ self openPopup ].
	self collapsed: [ self closePopup ].
	
	self add: (resizerLook := BrLayoutResizerLook inherit
		inheritIn: [ :aBlock | aBlock value: (self isAttachedToWidget
			ifTrue: [ self widgetContent childNamed: #popupContent ifFound: #yourself ifNone: [ BlElement new ] ]
			ifFalse: [ BlElement new ])])
]

{ #category : #initialization }
BrPopupLook >> initializeListeners [
	super initializeListeners.
	
	self when: BrPopupTargetChanged do: [ :anEvent | self popupTarget: anEvent popupTarget ].
	self when: BrPopupStencilChanged do: [ :anEvent | self popupStencil: anEvent popupStencil ]
]

{ #category : #initialization }
BrPopupLook >> initializeRequests [
	super initializeRequests.
	
	self request: BrPopupTargetRequest new.
	self request: BrPopupStencilRequest new
]

{ #category : #private }
BrPopupLook >> openPopup [
	self ensureContent.
	self widgetDo: [ :aWidget |
		(aWidget isAttachedToSceneGraph not and: [ aWidget hasParent not ])
			ifTrue: [ self popupTarget openPopup: aWidget ] ]
]

{ #category : #accessing }
BrPopupLook >> popupStencil [
	^ popupStencil
]

{ #category : #accessing }
BrPopupLook >> popupStencil: aStencil [
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
BrPopupLook >> popupTarget [
	<return: #BrPopupTarget>

	^ popupTarget
]

{ #category : #accessing }
BrPopupLook >> popupTarget: aPopupTarget [
	| isOpened |
	
	isOpened := (self request: BrExpansionStateRequest oneWay) isExpanded.
	isOpened ifTrue: [ self closePopup ].
	popupTarget := aPopupTarget.
	isOpened ifTrue: [ self openPopup ]
]
