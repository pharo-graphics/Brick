Class {
	#name : #BrTabModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'contentStencilBuilder',
		'toolbarStencilBuilder',
		'actionbarStencilBuilder',
		'selected'
	],
	#category : #'Brick-Tabs - Model'
}

{ #category : #'api - tab' }
BrTabModel >> actionbarStencil: anActionbarStencilBuilder [
	"Set a stencil to be used to create an action bar for this tab.
	An action bar is usually located inside of the tab itself, for example a close button"

	actionbarStencilBuilder := anActionbarStencilBuilder asStencilBuilder.
	self notifyActionbarChanged: actionbarStencilBuilder
]

{ #category : #accessing }
BrTabModel >> actionbarStencilBuilder [
	<return: #BrStencilBuilder>

	^ actionbarStencilBuilder
]

{ #category : #'api - tab' }
BrTabModel >> actionsStencil: anActionStencilBuilder [
	self
		deprecated: 'Please use #toolbarStencil: instead'
		transformWith: '`@receiver actionsStencil:: `@statements1' 
						-> '`@receiver toolbarStencil: `@statements1'.
	
	self toolbarStencil: anActionStencilBuilder
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

	self when: BrTabActionbarRequest reply: [ :aResponse | aResponse stencil: actionbarStencilBuilder ].
	self when: BrTabToolbarRequest reply: [ :aResponse | aResponse stencil: toolbarStencilBuilder ].

	"I subscribe to selection wish in order to record the selection state so that a tab group
	could automatically select a newly added tab if it is preselected"
	self when: BrSelectedWish do: [ :aWish | selected := aWish selected ]
]

{ #category : #'api - selection' }
BrTabModel >> isSelected [
	<return: #Boolean>

	^ selected
]

{ #category : #notifying }
BrTabModel >> notifyActionbarChanged: aStencil [
	self dispatchEvent: (BrTabActionbarChangedEvent new stencil: aStencil)
]

{ #category : #notifying }
BrTabModel >> notifyToolbarChanged: aStencil [
	self dispatchEvent: (BrTabToolbarChangedEvent new stencil: aStencil)
]

{ #category : #'api - selection' }
BrTabModel >> select [
	self isSelected
		ifFalse: [ self dispatchEvent: (BrSelectedWish selected: true) ]
]

{ #category : #'api - selection' }
BrTabModel >> selected: aBoolean [
	aBoolean
		ifTrue: [ self select ]
		ifFalse: [ self deselect ]
]

{ #category : #'api - tab' }
BrTabModel >> stencil: aStencilBuilder [
	"Set a stencil to be used to create a content of a tab.
	It should be computed lazily by the Tab widget on demand"

	contentStencilBuilder := aStencilBuilder asStencilBuilder
]

{ #category : #'api - tab' }
BrTabModel >> toolbarStencil: aToolbarStencilBuilder [
	"Set a stencil to be used to create a toolbar for this tab.
	A toolbar is usually located on the right side of a tab group header and changes depending
	on the currently selected tab"

	toolbarStencilBuilder := aToolbarStencilBuilder asStencilBuilder.
	self notifyToolbarChanged: toolbarStencilBuilder
]

{ #category : #accessing }
BrTabModel >> toolbarStencilBuilder [
	<return: #BrStencilBuilder>

	^ toolbarStencilBuilder
]
