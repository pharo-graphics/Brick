Class {
	#name : #BrBreadcrumbModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'items'
	],
	#category : #'Brick-Breadcrumb - Model'
}

{ #category : #'api - items' }
BrBreadcrumbModel >> addItem: aWidgetModel [
	self
		assert: [ aWidgetModel isNotNil ]
		description: [ 'Can not add nil widget model' ].

	self items add: aWidgetModel.
	self onItemAdded: aWidgetModel
]

{ #category : #testing }
BrBreadcrumbModel >> hasItems [
	<return: #Boolean>
	
	^ self numberOfItems > 0
]

{ #category : #initialization }
BrBreadcrumbModel >> initialize [
	super initialize.
	items := OrderedCollection new.
]

{ #category : #'api - items' }
BrBreadcrumbModel >> itemAt: anIndex [
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
BrBreadcrumbModel >> items [
	<return: #Collection of: #BrWidgetModel>
	^ items
]

{ #category : #notifying }
BrBreadcrumbModel >> notifyItemAdded: aWidgetModel [
	self dispatchEvent: (BrBreadcrumbItemAddedEvent item: aWidgetModel)
]

{ #category : #notifying }
BrBreadcrumbModel >> notifyItemRemoved: aWidgetModel [
	self dispatchEvent: (BrBreadcrumbItemRemovedEvent item: aWidgetModel)
]

{ #category : #accessing }
BrBreadcrumbModel >> numberOfItems [
	<return: #Number>

	^ self items size
]

{ #category : #hooks }
BrBreadcrumbModel >> onItemAdded: aWidgetModel [
	self notifyItemAdded: aWidgetModel.
]

{ #category : #hooks }
BrBreadcrumbModel >> onItemRemoved: aWidgetModel at: anItemIndex [
	self notifyItemRemoved: aWidgetModel
]

{ #category : #'api - items' }
BrBreadcrumbModel >> removeAllItems [	
	self numberOfItems to: 1 by: -1 do: [ :anIndex | self removeItemAt: anIndex ]
]

{ #category : #'api - items' }
BrBreadcrumbModel >> removeItem: aWidgetModel [
	| anItemIndex |

	anItemIndex := self items indexOf: aWidgetModel.
	self removeItemAt: anItemIndex
]

{ #category : #'api - items' }
BrBreadcrumbModel >> removeItemAt: anIndex [
	| aRemovedItem |
	
	self
		assert: [ anIndex between: 1 and: self numberOfItems ]
		description: [ 'Wrong item index! (Out of bounds)' ].

	aRemovedItem := self itemAt: anIndex.
	self items removeAt: anIndex.
	self onItemRemoved: aRemovedItem at: anIndex
]
