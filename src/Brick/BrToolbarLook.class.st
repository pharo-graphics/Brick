"
! ToolbarLook

!! Toolbar Order-Independent Item Binding 

You may noticed that ${method:BrToolbarLook>>#initialize}$ initialize ==item== instance variable as an ${class:OrderedDictionary}$. The reason for the ordered dictionary is to allow order-independent binding of toolbar view (${class:BrToolbarItem}$) to the tab model ${class:BrToolbarItemModel}$. To understand it easily, let's check the following excercise: 

First, we create and inspect a ${class:BrToolbar}$ instance:

[[[
toolbar := BrToolbar new.
toolbar look: BrToolbarLook + BrLayoutLook linearHorizontal matchParent.
]]]

Please, inspect the result in order to observe changes while executing the following code snippets.

Second, we create three toolbar items (${class:BrToolbarItemModel}$):

[[[
item1 := BrToolbarItemModel new.
toolbar viewModel addItem: item1.

item2 := BrToolbarItemModel new.
toolbar viewModel addItem: item2.

item3 := BrToolbarItemModel new.
toolbar viewModel addItem: item3.
]]]


Third, we attach a view ${class:BlElement}$ to the second view model:

[[[
BlElement new
	size: 70@40;
	background: Color blue;
	viewModel: item2.
]]]

Fourth, we attach a view ${class:BlElement}$ to the third view model. Notice, that it will be added after the second (blue color) element:

[[[	
BlElement new
	size: 70@40;
	background: Color red;
	viewModel: item3.
]]]

Finaly, we attach a view ${class:BlElement}$ to the first view model. Notice, that it will be added before the second (blue color) element:

[[[
BlElement new
	size: 70@40;
	background: Color green;
	viewModel: item1.
]]]

So, you should end up with three toolbar item views with the the following order: green, blue, red. 
NOTE: It would be nice to explain, why this order-independed feature is important.

"
Class {
	#name : #BrToolbarLook,
	#superclass : #BrLook,
	#instVars : [
		'items'
	],
	#category : 'Brick-Toolbar - Look'
}

{ #category : #initialization }
BrToolbarLook >> initialize [
	super initialize.
	items := OrderedDictionary new.
]

{ #category : #initialization }
BrToolbarLook >> initializeListeners [
	super initializeListeners.

	self when: BrToolbarItemAddedEvent do: [ :anEvent | self onItemAdded: anEvent item ].
	self when: BrToolbarItemRemovedEvent do: [ :anEvent | self onItemRemoved: anEvent item ]
]

{ #category : #'private - accessing' }
BrToolbarLook >> itemElements [
	^ items values select: #isNotNil
]

{ #category : #accessing }
BrToolbarLook >> items [
	<return: #OrderedDictionary>

	^ items
]

{ #category : #hooks }
BrToolbarLook >> onItemAdded: aWidgetModel [
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
BrToolbarLook >> onItemRemoved: aWidgetModel [
	self
		assert: [ self isAttachedToWidget ]
		description: [ 'I can not receive the item removed event without being attached to a widget' ].

	self items removeKey: aWidgetModel.

	aWidgetModel widgetDo: [ :aToolbarItemElement |
		self widgetContent removeChild: aToolbarItemElement ]
]
