Class {
	#name : #BrBreadcrumbLook,
	#superclass : #BrLook,
	#instVars : [
		'items',
		'separators',
		'separatorStencil'
	],
	#category : #'Brick-Breadcrumb - Look'
}

{ #category : #'private - update' }
BrBreadcrumbLook >> addItemsAndSeparators [
	| currentItemElements currentSeparatorElements |

	currentItemElements := self itemElements.
	self separators removeKey: currentItemElements last ifAbsent: [  ].
	currentItemElements allButLastDo: [ :eachItemElement |
		self separators at: eachItemElement ifAbsentPut: self newSeparator ].

	currentSeparatorElements := self separatorElements.

	self
		assert: [ (currentItemElements size - 1) = currentSeparatorElements size ]
		description: [ 'There must be one separator less then amount of items' ].

	currentItemElements do: [ :eachItemElement |
		self widgetContent addChild: eachItemElement.
		self separators at: eachItemElement ifPresent: [ :eachSeparatorElement |
			self widgetContent addChild: eachSeparatorElement ] ]
]

{ #category : #initialization }
BrBreadcrumbLook >> initialize [
	super initialize.

	"mapping WidgetModel -> Element"
	items := OrderedDictionary new.

	"mapping Element -> Separator"
	separators := Dictionary new.

	separatorStencil := [ BlElement new size: 0@0 ] asStencil
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

{ #category : #'private - instance creation' }
BrBreadcrumbLook >> newSeparator [
	<return: #BlElement>

	^ separatorStencil asElement
]

{ #category : #hooks }
BrBreadcrumbLook >> onItemAdded: aWidgetModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item added event without being attached to a widget' ].

	self items at: aWidgetModel put: nil.

	aWidgetModel whenAttachedDo: [ :aToolbarItemElement |
		self removeItemsAndSeparators.
		self items at: aWidgetModel put: aToolbarItemElement.
		self addItemsAndSeparators ]
]

{ #category : #hooks }
BrBreadcrumbLook >> onItemRemoved: aWidgetModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item removed event without being attached to a widget' ].
	
	self widgetDo: [ self removeItemsAndSeparators ].
	self items removeKey: aWidgetModel.
	self widgetDo: [ self addItemsAndSeparators ]
]

{ #category : #'private - update' }
BrBreadcrumbLook >> removeItemsAndSeparators [
	self widgetContent removeChildren: self itemElements.
	self widgetContent removeChildren: self separatorElements
]

{ #category : #accessing }
BrBreadcrumbLook >> separator: aStencil [
	self
		assert: [ aStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	separatorStencil := aStencil asStencil.

	self widgetDo: [
		self removeItemsAndSeparators.
		self addItemsAndSeparators ]
]

{ #category : #'private - accessing' }
BrBreadcrumbLook >> separatorElements [
	<return: #Collection of: #BlElement>
	
	^ separators values
]

{ #category : #'private - accessing' }
BrBreadcrumbLook >> separators [
	<return: #OrderedDictionary key: #BlElement value: #BlElement>

	^ separators
]
