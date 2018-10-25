Class {
	#name : #BrBreadcrumbLook,
	#superclass : #BrLook,
	#instVars : [
		'items'
	],
	#category : #'Brick-Breadcrumb - Look'
}

{ #category : #initialization }
BrBreadcrumbLook >> initialize [
	super initialize.
	items := OrderedDictionary new.
]

{ #category : #initialization }
BrBreadcrumbLook >> initializeListeners [
	super initializeListeners.

	self when: BrBreadcrumbItemAddedEvent do: [ :anEvent | self onItemAdded: anEvent item ].
	self when: BrBreadcrumbItemRemovedEvent do: [ :anEvent | self onItemRemoved: anEvent item ]
]

{ #category : #'private - accessing' }
BrBreadcrumbLook >> itemElements [
	<return: #Collection of: #BlElement>

	^ items values select: #isNotNil
]

{ #category : #'private - accessing' }
BrBreadcrumbLook >> items [
	<return: #OrderedDictionary key: #BrWidgetModel value: #BlElement>

	^ items
]

{ #category : #hooks }
BrBreadcrumbLook >> onItemAdded: aWidgetModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item added event without being attached to a widget' ].

	self items at: aWidgetModel put: nil.

	aWidgetModel whenAttachedDo: [ :aToolbarItemElement |
		self widgetContent removeChildren: self itemElements.
		self items at: aWidgetModel put: aToolbarItemElement.
		self widgetContent addChildren: self itemElements ]
]

{ #category : #hooks }
BrBreadcrumbLook >> onItemRemoved: aWidgetModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item removed event without being attached to a widget' ].

	self items removeKey: aWidgetModel.

	aWidgetModel widgetDo: [ :aToolbarItemElement |
		self widgetContent removeChild: aToolbarItemElement ]
]
