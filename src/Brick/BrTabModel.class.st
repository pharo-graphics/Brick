Class {
	#name : #BrTabModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'contentStencilBuilder',
		'actionStencilBuilder',
		'selected'
	],
	#category : #'Brick-Tabs - Model'
}

{ #category : #accessing }
BrTabModel >> actionStencilBuilder [
	^ actionStencilBuilder
]

{ #category : #'api - tab' }
BrTabModel >> actionsStencil: anActionStencilBuilder [
	actionStencilBuilder := anActionStencilBuilder asStencilBuilder
]

{ #category : #'mouse handlers' }
BrTabModel >> clickEvent: anEvent [
	(self request: BrActivationRequest oneWay) isActivated
		ifFalse: [ ^ self ].
	
	anEvent consumed: true.
	self select
]

{ #category : #accessing }
BrTabModel >> contentStencilBuilder [
	<return: #BrStencilBuilder>
	
	^ contentStencilBuilder
]

{ #category : #'api - selection' }
BrTabModel >> deselect [
	self isSelected
		ifTrue: [ self dispatchEvent: (BrSelectedWish selected: false) ]
]

{ #category : #hooks }
BrTabModel >> initialize [
	super initialize.
	
	selected := false
]

{ #category : #hooks }
BrTabModel >> initializeListeners [
	super initializeListeners.

	self when: BrSelectedWish do: [ :aWish | selected := aWish selected ]
]

{ #category : #'api - selection' }
BrTabModel >> isSelected [
	<return: #Boolean>

	^ selected
]

{ #category : #accessing }
BrTabModel >> labelModel [
	^ self children 
		detect: [ :each | each isKindOf: BrLabelModel ]
		ifNone: [ nil ]
]

{ #category : #accessing }
BrTabModel >> labelText [
	^ self labelModel 
		ifNil: [ nil ]
		ifNotNil: [ :labelModel | labelModel text ]
]

{ #category : #'api - selection' }
BrTabModel >> select [
	self isSelected
		ifFalse: [ self dispatchEvent: (BrSelectedWish selected: true) ]
]

{ #category : #'api - tab' }
BrTabModel >> stencil: aStencilBuilder [
	contentStencilBuilder := aStencilBuilder asStencilBuilder
]
