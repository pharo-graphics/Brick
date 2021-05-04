Class {
	#name : #BrTabGroupHeaderWithToolbarAptitude,
	#superclass : #BrTabGroupHeaderAptitude,
	#instVars : [
		'toolbar',
		'actionbar'
	],
	#category : #'Brick-Tabs - Look'
}

{ #category : #'api - accessing' }
BrTabGroupHeaderWithToolbarAptitude >> actionbar [
	<return: #BlElement>

	^ actionbar
]

{ #category : #initialization }
BrTabGroupHeaderWithToolbarAptitude >> initialize [
	super initialize.
	"We have the following structure:
	
	- header
		- scrollable
			- tabbar
		- toolbar
		- actionbar
	"
	toolbar := BlElement new labeled: 'Toolbar'.
	actionbar := BlElement new labeled: 'Actionbar'.
	
	
	header addChild: toolbar as: #toolbar.
	header addChild: actionbar as: #actionbar.

	
]

{ #category : #initialization }
BrTabGroupHeaderWithToolbarAptitude >> initializeListeners [
	super initializeListeners.
	self
		when: BrTabGroupActionbarChangedEvent
		do: [ :anEvent | self onActionbarChanged: anEvent stencil ].
	self
		when: BrTabToolbarChangedEvent
		do: [ :anEvent | self onTabToolbarChanged: anEvent tab ].
	
]

{ #category : #initialization }
BrTabGroupHeaderWithToolbarAptitude >> initializeRequests [
	super initializeRequests.
	
	self request: BrTabGroupTabsRequest new.
	self request: BrTabGroupActionbarRequest new
]

{ #category : #hooks }
BrTabGroupHeaderWithToolbarAptitude >> onActionbarChanged: aStencil [
	self actionbar removeChildren.

	aStencil
		ifNotNil: [ self actionbar addChild: aStencil asElement ]
]

{ #category : #hooks }
BrTabGroupHeaderWithToolbarAptitude >> onTabDeselected: aBrTabModel [ 
	super onTabDeselected: aBrTabModel.
	self toolbar removeChildren
]

{ #category : #hooks }
BrTabGroupHeaderWithToolbarAptitude >> onTabSelected: aTabModel [
	super onTabSelected: aTabModel.
	self updateToolbarFrom: aTabModel
]

{ #category : #hooks }
BrTabGroupHeaderWithToolbarAptitude >> onTabToolbarChanged: aTabModel [
	aTabModel isSelected ifFalse: [ ^ self ].
	self updateToolbarFrom: aTabModel.
]

{ #category : #'api - accessing' }
BrTabGroupHeaderWithToolbarAptitude >> toolbar [
	<return: #BlElement>

	^ toolbar
]

{ #category : #'api - accessing' }
BrTabGroupHeaderWithToolbarAptitude >> toolbarDo: aBlock [
	aBlock value: self toolbar
]

{ #category : #updating }
BrTabGroupHeaderWithToolbarAptitude >> updateToolbarFrom: aTabModel [
	self toolbar removeChildren.
	aTabModel toolbarStencilBuilder
		ifNotNil: [ :aStencil | 
			| aToolbarElement |
			aToolbarElement := aStencil
				tabModel: aTabModel;
				asElement.
			aStencil tabModel: nil.
			self toolbar addChild: aToolbarElement ]
]
