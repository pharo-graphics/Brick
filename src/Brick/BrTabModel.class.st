Class {
	#name : #BrTabModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'selected',
		'contentStencilBuilder',
		'actionStencilBuilder'
	],
	#category : 'Brick-Tabs - Model'
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
	"self isEnabled
		ifFalse: [ ^ self ]."

	anEvent consumed: true.
	self select
]

{ #category : #accessing }
BrTabModel >> contentStencilBuilder [
	<return: #BrStencilBuilder>
	
	^ contentStencilBuilder
]

{ #category : #'api - tab' }
BrTabModel >> deselect [
	self isSelected
		ifFalse: [ ^ self ].

	selected := false.
	self notifyTabDeselected
]

{ #category : #initialization }
BrTabModel >> initialize [
	super initialize.

	selected := false.
	contentStencilBuilder := [ BlElement new size: 50@50; background: Color random ] asStencilBuilder.
	actionStencilBuilder := [ BlElement new size: 0@0 ] asStencilBuilder
]

{ #category : #'api - testing' }
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

{ #category : #notifying }
BrTabModel >> notifyTabDeselected [
	self dispatchEvent: (BrTabDeselectedEvent tab: self)
]

{ #category : #notifying }
BrTabModel >> notifyTabSelected [
	self dispatchEvent: (BrTabSelectedEvent tab: self)
]

{ #category : #notifying }
BrTabModel >> notifyTabSelectionChanged [
	self isSelected
		ifTrue: [ self notifyTabSelected ]
		ifFalse: [ self notifyTabDeselected ]
]

{ #category : #hooks }
BrTabModel >> onAttachedTo: anElement [
	super onAttachedTo: anElement.

	anElement when: BrTabStateRequest
		do: [ :anEvent |
			anEvent source dispatchEvent: (self isSelected
				ifTrue: [ BrTabSelectedEvent tab: self ]
				ifFalse: [ BrTabDeselectedEvent tab: self ]) ]
]

{ #category : #'api - tab' }
BrTabModel >> select [
	self isSelected
		ifTrue: [ ^ self ].

	selected := true.
	self notifyTabSelected
]

{ #category : #'api - tab' }
BrTabModel >> selected: aBoolean [
	aBoolean
		ifTrue: [ self select ]
		ifFalse: [ self deselect ]
]

{ #category : #'api - tab' }
BrTabModel >> stencil: aStencilBuilder [
	contentStencilBuilder := aStencilBuilder asStencilBuilder
]
