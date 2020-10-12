"
! ToolbarLook

!! Toolbar Order-Independent Item Binding 

You may noticed that ${method:BrToolbarLook>>#initialize}$ initialize ==item== instance variable as an ${class:OrderedDictionary}$. The reason for the ordered dictionary is to allow order-independent binding of toolbar view to the tab model. To understand it easily, let's check the following excercise: 

First, we create and inspect a ${class:BrToolbar}$ instance:

[[[
toolbar := BrToolbar new.
toolbar look: BrMaterialToolbarLook.
]]]

Second, we create three toolbar items:

[[[
toolbar addItem: (BrButton new 
		border: (BlBorder paint: Color red);
		look: BrMaterialToggleLabelledLook;
		label: 'Hello'; 
		action: [ self inform: 'Red' ]).

toolbar addItem: (BrButton new 
		border: (BlBorder paint: Color green);
		look: BrMaterialToggleLabelledLook;
		label: 'Hello'; 
		action: [ self inform: 'Green' ]).

toolbar addItem: ((BrButton new 
		border: (BlBorder paint: Color blue);
		look: BrMaterialToggleLabelledLook;
		label: 'Hello'; 
		action: [ self inform: 'Blue' ])).
]]]


So, you should end up with three toolbar item views with the the following order: red, green, blue. 
NOTE: It would be nice to explain, why this order-independed feature is important.

"
Class {
	#name : #BrToolbarLook,
	#superclass : #BrLook,
	#instVars : [
		'items'
	],
	#category : #'Brick-Toolbar - Look'
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
