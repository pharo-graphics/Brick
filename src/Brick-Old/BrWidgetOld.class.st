Class {
	#name : #BrWidgetOld,
	#superclass : #BlElement,
	#instVars : [
		'view',
		'controller',
		'disabled',
		'backgroundColor',
		'borderColor',
		'borderWidth',
		'contextMenu',
		'tooltip',
		'skin'
	],
	#category : 'Brick-Old'
}

{ #category : #'accessing styles' }
BrWidgetOld >> backgroundColor [
	^ self backgroundColorProperty value
]

{ #category : #'accessing styles' }
BrWidgetOld >> backgroundColor: anObject [
	self backgroundColorProperty value: anObject
]

{ #category : #'accessing properties' }
BrWidgetOld >> backgroundColorProperty [
	^ backgroundColor
		ifNil: [ backgroundColor := BlObjectProperty on: self named: #backgroundColor  default: Color white ]
]

{ #category : #'accessing styles' }
BrWidgetOld >> borderColor [
	^ self borderColorProperty value
]

{ #category : #'accessing styles' }
BrWidgetOld >> borderColor: anObject [
	self borderColorProperty value: anObject
]

{ #category : #'accessing properties' }
BrWidgetOld >> borderColorProperty [
	^ borderColor ifNil: [ 
		borderColor := BlObjectProperty on: self named: #borderColor default: Color transparent ]
]

{ #category : #'accessing styles' }
BrWidgetOld >> borderWidth [
	^ self borderWidthProperty value
]

{ #category : #'accessing styles' }
BrWidgetOld >> borderWidth: anObject [
	self borderWidthProperty value: anObject
]

{ #category : #'accessing properties' }
BrWidgetOld >> borderWidthProperty [
	^ borderWidth ifNil: [ borderWidth := BlObjectProperty on: self named: #borderWidth default: 0]
]

{ #category : #'event managing' }
BrWidgetOld >> buildEventDispatchChain: aTail [
	self isDisabled ifTrue:[^ aTail].
	^ super buildEventDispatchChain: aTail
]

{ #category : #accessing }
BrWidgetOld >> contextMenu [
	^ contextMenu
]

{ #category : #accessing }
BrWidgetOld >> contextMenu: anObject [
	contextMenu := anObject
]

{ #category : #accessing }
BrWidgetOld >> controller [
	^ controller
]

{ #category : #accessing }
BrWidgetOld >> controller: aController [
	self controller ifNotNil: [ :oldCtrl | oldCtrl onUninstalledIn: self ].
	controller := aController.
	aController onInstalledIn: self
]

{ #category : #'initialize-release' }
BrWidgetOld >> defaultController [
	^ self subclassResponsibility
]

{ #category : #'initialize-release' }
BrWidgetOld >> defaultSkin [
	^ self subclassResponsibility
]

{ #category : #'as yet unclassified' }
BrWidgetOld >> defaultStyler [
	^ BrBaseStyler on: self
]

{ #category : #'accessing styles' }
BrWidgetOld >> disabled [
	^ self disabledProperty value
]

{ #category : #'accessing styles' }
BrWidgetOld >> disabled: anObject [
	self disabledProperty value: anObject
]

{ #category : #'accessing properties' }
BrWidgetOld >> disabledProperty [
	^ disabled ifNil: [ disabled := BlObjectProperty on: self named: #disabled default: false]
]

{ #category : #'initialize-release' }
BrWidgetOld >> initialize [
	super initialize.
	self initializeWidget.
	self controller: self defaultController.
	self skin: self defaultSkin.
	self mouseCursor: BlCursor default
	
]

{ #category : #'initialize-release' }
BrWidgetOld >> initializeWidget [
	
]

{ #category : #accessing }
BrWidgetOld >> skin [
	^ skin
]

{ #category : #accessing }
BrWidgetOld >> skin: aSkin [
	self skin ifNotNil: [ :oldSkin | self removeEventFilter: oldSkin ].
	skin := aSkin.
	self addEventFilter: aSkin
]

{ #category : #accessing }
BrWidgetOld >> tooltip [
	^ tooltip
]

{ #category : #accessing }
BrWidgetOld >> tooltip: anObject [
	tooltip := anObject
]
