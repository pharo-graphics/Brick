Class {
	#name : #BrToolbarModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'items'
	],
	#category : 'Brick-Toolbar - Model'
}

{ #category : #'api - items' }
BrToolbarModel >> addItem: aWidgetModel [
	self
		assert: [ aWidgetModel isNotNil ]
		description: [ 'Can not add nil widget model' ].

	self items add: aWidgetModel.
	self onItemAdded: aWidgetModel
]

{ #category : #testing }
BrToolbarModel >> hasItems [
	<return: #Boolean>
	
	^ self numberOfItems > 0
]

{ #category : #initialization }
BrToolbarModel >> initialize [
	super initialize.
	items := OrderedCollection new.
]

{ #category : #'api - items' }
BrToolbarModel >> itemAt: anIndex [
	<return: #BrWidgetModel>
	self
		assert: [ anIndex isInteger ] 
		description: [ 'Index must be an integer' ].
	self
		assert: [ anIndex > 0 ] 
		description: [ 'Index must be a positive integer' ].
	self
		assert: [ anIndex <= self numberOfItems ] 
		description: [ 'Index must be less of equal to number of existing items' ].

	^ self items at: anIndex
]

{ #category : #accessing }
BrToolbarModel >> items [
	<return: #Collection of: #BrWidgetModel>
	^ items
]

{ #category : #notifying }
BrToolbarModel >> notifyItemAdded: aWidgetModel [
	self dispatchEvent: (BrToolbarItemAddedEvent item: aWidgetModel)
]

{ #category : #notifying }
BrToolbarModel >> notifyItemRemoved: aWidgetModel [
	self dispatchEvent: (BrToolbarItemRemovedEvent item: aWidgetModel)
]

{ #category : #accessing }
BrToolbarModel >> numberOfItems [
	<return: #Number>

	^ self items size
]

{ #category : #hooks }
BrToolbarModel >> onItemAdded: aWidgetModel [
	self notifyItemAdded: aWidgetModel.
]

{ #category : #hooks }
BrToolbarModel >> onItemRemoved: aWidgetModel at: anItemIndex [
	self notifyItemRemoved: aWidgetModel
]

{ #category : #'api - items' }
BrToolbarModel >> removeItem: aWidgetModel [
	| anItemIndex |

	anItemIndex := self items indexOf: aWidgetModel.
	self items remove: aWidgetModel.
	self onItemRemoved: aWidgetModel at: anItemIndex
]

{ #category : #'api - items' }
BrToolbarModel >> removeItemAt: anIndex [
	self removeItem: (self itemAt: anIndex)
]
