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

	self when: BrBreadcrumbItemAddedEvent do: [ :anEvent | self onItemAdded: anEvent item at: anEvent index ].
	self when: BrBreadcrumbItemRemovedEvent do: [ :anEvent | self onItemRemoved: anEvent item at: anEvent index ]
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
BrBreadcrumbLook >> onItemAdded: aWidgetModel at: anIndex [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item added event without being attached to a widget' ].

	self items at: aWidgetModel put: nil.

	aWidgetModel whenAttachedDo: [ :anItemElement |
		self items at: aWidgetModel put: anItemElement.
		self onItemAttached: anItemElement at: anIndex ]
]

{ #category : #hooks }
BrBreadcrumbLook >> onItemAttached: anItemElement at: anIndex [
	self subclassResponsibility
]

{ #category : #hooks }
BrBreadcrumbLook >> onItemRemoved: aWidgetModel at: anIndex [
	self subclassResponsibility
]

{ #category : #hooks }
BrBreadcrumbLook >> onSeparatorChanged: aSeparatorStencil [
	self subclassResponsibility
]

{ #category : #accessing }
BrBreadcrumbLook >> separator: aStencil [
	self
		assert: [ aStencil isNotNil ]
		description: [ 'Stencil must not be nil' ].

	separatorStencil := aStencil asStencil.
	self onSeparatorChanged: separatorStencil
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
