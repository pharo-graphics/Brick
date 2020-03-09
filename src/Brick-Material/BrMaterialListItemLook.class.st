Class {
	#name : #BrMaterialListItemLook,
	#superclass : #BrLook,
	#instVars : [
		'padding'
	],
	#category : #'Brick-Material-List'
}

{ #category : #'api - configuration' }
BrMaterialListItemLook >> beCompact [
	self height: self compactHeight.
	self padding: self compactPadding
]

{ #category : #'api - configuration' }
BrMaterialListItemLook >> beLarge [
	self height: self largeHeight.
	self padding: self largePadding
]

{ #category : #'api - configuration' }
BrMaterialListItemLook >> beMedium [
	self height: self mediumHeight.
	self padding: self mediumPadding
]

{ #category : #'api - configuration' }
BrMaterialListItemLook >> beSmall [
	self height: self smallHeight.
	self padding: self smallPadding
]

{ #category : #'api - configuration' }
BrMaterialListItemLook >> beTiny [
	self height: self tinyHeight.
	self padding: self tinyPadding
]

{ #category : #configuration }
BrMaterialListItemLook >> compactHeight [
	"Return the height to be used for the compact version of the list item - without icon"
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : #configuration }
BrMaterialListItemLook >> compactPadding [
	"Return the padding to be used for the compact version of the list item - without icon"
	<return: #BlInsets>

	^ self subclassResponsibility
]

{ #category : #accessing }
BrMaterialListItemLook >> height: aNumber [
	
]

{ #category : #initialization }
BrMaterialListItemLook >> initialize [
	super initialize.
	
	self
		addChangeProperty: #(widget layout)
			with: [ BlLinearLayout horizontal alignCenterLeft ];
		addChangeProperty: #(widget constraints vertical resizer)
			with: [ BlLayoutResizer fitContent ];
		addChangeProperty: #(widget constraints horizontal resizer)
			with: [ BlLayoutResizer matchParent ].
	
	self beCompact.
	self addChangeProperty: #(widget padding) with: [ self padding ].
	self addChangeProperty: #(widget background) with: [ Color white ]
]

{ #category : #initialization }
BrMaterialListItemLook >> initializeListeners [
	super initializeListeners.
	
	self when: BlMouseEnterEvent do: [ self widgetDo: [ :aWidget | aWidget background: (Color gray alpha: 0.1) ] ].
	self when: BlMouseLeaveEvent do: [ self widgetDo: [ :aWidget | aWidget background: Color transparent ] ]
]

{ #category : #configuration }
BrMaterialListItemLook >> largeHeight [
	"Return the height to be used for the large version of the list item - with large icon"
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : #configuration }
BrMaterialListItemLook >> largePadding [
	"Return the padding to be used for the large version of the list item - with large icon"
	<return: #BlInsets>

	^ self subclassResponsibility
]

{ #category : #configuration }
BrMaterialListItemLook >> mediumHeight [
	"Return the height to be used for the medium version of the list item - with medium icon"
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : #configuration }
BrMaterialListItemLook >> mediumPadding [
	"Return the padding to be used for the medium version of the list item - with medium icon"
	<return: #BlInsets>

	^ self subclassResponsibility
]

{ #category : #accessing }
BrMaterialListItemLook >> padding [
	<return: #BlInsets>

	^ padding
]

{ #category : #accessing }
BrMaterialListItemLook >> padding: aBlInsets [
	padding := aBlInsets
]

{ #category : #configuration }
BrMaterialListItemLook >> smallHeight [
	"Return the height to be used for the small version of the list item - with small icon"
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : #configuration }
BrMaterialListItemLook >> smallPadding [
	"Return the padding to be used for the small version of the list item - with small icon"
	<return: #BlInsets>

	^ self subclassResponsibility
]

{ #category : #configuration }
BrMaterialListItemLook >> tinyHeight [
	"Return the height to be used for the tiny version of the list item - with tiny icon"
	<return: #Number>

	^ self subclassResponsibility
]

{ #category : #configuration }
BrMaterialListItemLook >> tinyPadding [
	"Return the padding to be used for the tiny version of the list item - with tiny icon"
	<return: #BlInsets>

	^ self subclassResponsibility
]
