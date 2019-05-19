Class {
	#name : #BrLayoutLook,
	#superclass : #BrLook,
	#traits : 'TBlAlignable',
	#classTraits : 'TBlAlignable classTrait',
	#instVars : [
		'targetName',
		'layout',
		'horizontalResizer',
		'verticalResizer',
		'consraintsBlock',
		'verticalAlignment',
		'horizontalAlignment'
	],
	#category : 'Brick-! Core'
}

{ #category : #'api - instance creation' }
BrLayoutLook class >> constraintsDo: aBlockClosure [
	^ self new constraintsDo: aBlockClosure
]

{ #category : #'api - instance creation' }
BrLayoutLook class >> fitContent [
	^ self new fitContent
]

{ #category : #'api - instance creation' }
BrLayoutLook class >> frame [
	^ self new frame
]

{ #category : #'api - instance creation' }
BrLayoutLook class >> gridColumn [
	^ self new gridColumn
]

{ #category : #'api - instance creation' }
BrLayoutLook class >> gridRow [
	^ self new gridRow
]

{ #category : #'api - instance creation' }
BrLayoutLook class >> linearHorizontal [
	^ self new linearHorizontal
]

{ #category : #'api - instance creation' }
BrLayoutLook class >> linearVertical [
	^ self new linearVertical
]

{ #category : #'api - instance creation' }
BrLayoutLook class >> matchParent [
	^ self new matchParent
]

{ #category : #'api - instance creation' }
BrLayoutLook class >> of: aSymbolicName [
	^ self new targetName: aSymbolicName
]

{ #category : #accessing }
BrLayoutLook class >> size: anExtent [
	^ self new
		width: anExtent x;
		height: anExtent y
]

{ #category : #'api - constraints' }
BrLayoutLook >> constraintsDo: aBlock [
	
	self
		assert: [ aBlock isNotNil ]
		description: [ 'Constraints block' ].

	consraintsBlock := aBlock.
	self widgetDo: [ :anElement | self targetElement constraintsDo: consraintsBlock ]
]

{ #category : #'api - resizers' }
BrLayoutLook >> fitContent [
	self hFitContent.
	self vFitContent
]

{ #category : #'api - layout' }
BrLayoutLook >> frame [
	self layout: BlFrameLayout new
]

{ #category : #'api - layout' }
BrLayoutLook >> gridColumn [
	self layout: (BlLinearLayout vertical)
]

{ #category : #'api - layout' }
BrLayoutLook >> gridRow [
	self layout: (BlLinearLayout horizontal)
]

{ #category : #'api - resizers' }
BrLayoutLook >> hFitContent [
	self horizontalResizer: BlLayoutResizer fitContent
]

{ #category : #'api - resizers' }
BrLayoutLook >> hMatchParent [
	self horizontalResizer: BlLayoutResizer matchParent
]

{ #category : #private }
BrLayoutLook >> hasTargetName [
	^ targetName isNotNil
]

{ #category : #'api - resizers' }
BrLayoutLook >> height: aNumber [
	self verticalResizer: (BlLayoutResizer exact: aNumber)
]

{ #category : #accessing }
BrLayoutLook >> horizontalAlignment [
	<return: #BlElementAlignment>
	
	^ horizontalAlignment
]

{ #category : #accessing }
BrLayoutLook >> horizontalAlignment: aBlElementAlignment [
	
	horizontalAlignment := aBlElementAlignment.
	self updateAlignment
]

{ #category : #accessing }
BrLayoutLook >> horizontalResizer [
	<return: #BlLayoutResizer>

	^ horizontalResizer
]

{ #category : #accessing }
BrLayoutLook >> horizontalResizer: aBlLayoutResizer [
	self
		assert: [ aBlLayoutResizer isNotNil ]
		description: [ 'Resizer must not be nil' ].

	horizontalResizer := aBlLayoutResizer.
	self widgetDo: [ :anElement | self targetElement constraintsDo: [ :c | c horizontal resizer: self horizontalResizer ] ]
]

{ #category : #initialization }
BrLayoutLook >> initialize [
	super initialize.

	"if target name is not set, look is applied on a #widget"
	targetName := nil.

	"to indicate that we don't influence existing element layout"
	layout := nil.
	horizontalResizer := BlLayoutResizer fitContent.
	verticalResizer := BlLayoutResizer fitContent.
	horizontalAlignment := BlNullAlignment horizontal.
	verticalAlignment := BlNullAlignment vertical.
	consraintsBlock := [ :c |  ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					self targetElement
						when: BlElementAddedToParentEvent
						do: [ self widgetDo: [ self onAddedToParent ] ] ];
				down: [ :e |  ];
				yourself).
	self
		addChangeProperty: #(targetElement constraints horizontal resizer)
		with: [ self horizontalResizer ].
	self
		addChangeProperty: #(targetElement constraints vertical resizer)
		with: [ self verticalResizer ].
	self
		addChange:
			(BrLookChange new
				up: [ :e | 
					self targetElement constraintsDo: [ :c | consraintsBlock value: c ].
					self layout ifNotNil: [ self targetElement layout: self layout ].
					self updateAlignment ];
				down: [ :e |  ];
				yourself)
]

{ #category : #accessing }
BrLayoutLook >> layout [
	<return: #BlLayout>

	^ layout
]

{ #category : #accessing }
BrLayoutLook >> layout: aBlLayout [
	layout := aBlLayout.
	
	self widgetDo: [ :anElement | self targetElement layout: self layout ]
]

{ #category : #accessing }
BrLayoutLook >> layoutDo: aBlock [
	aBlock value: self layout
]

{ #category : #'api - layout' }
BrLayoutLook >> linearHorizontal [
	self layout: BlLinearLayout horizontal
]

{ #category : #'api - layout' }
BrLayoutLook >> linearVertical [
	self layout: BlLinearLayout vertical
]

{ #category : #'api - resizers' }
BrLayoutLook >> matchParent [
	self hMatchParent.
	self vMatchParent
]

{ #category : #hooks }
BrLayoutLook >> onAddedToParent [
	self updateAlignment.
	
	self targetElement parent
		when: BlElementLayoutChangedEvent
		do: [ self onLayoutChanged ]
]

{ #category : #hooks }
BrLayoutLook >> onLayoutChanged [
	self updateAlignment
]

{ #category : #'api - resizers' }
BrLayoutLook >> size: aPoint [
	self width: aPoint x.
	self height: aPoint y
]

{ #category : #private }
BrLayoutLook >> targetElement [
	<return: #BlElement>

	self hasTargetName
		ifFalse: [ ^ self widget ].

	^ self widget
		childNamed: self targetName
		ifFound: [ :anElement | anElement ]
		ifNone: [ self error: 'Look target named #', self targetName asString, ' is not found!' ]
]

{ #category : #accessing }
BrLayoutLook >> targetName [
	<return: #Symbol>
	
	self
		assert: [ self hasTargetName ]
		description: [ 'Can not access target name if it is not set' ].

	^ targetName
]

{ #category : #accessing }
BrLayoutLook >> targetName: aSymbolicName [

	self
		assert: [ self hasTargetName not ]
		description: [ 'Target can not be changed' ].

	self
		assert: [ self isAttachedToWidget not ]
		description: [ 'Target can not be set once look is bound to a widget' ].

	targetName := aSymbolicName
]

{ #category : #private }
BrLayoutLook >> updateAlignment [
	| aTargetElement |

	self isAttachedToWidget
		ifFalse: [ ^ self ].

	aTargetElement := self targetElement.
	
	aTargetElement hasParent
		ifFalse: [ ^ self ].
	
	aTargetElement parent layout align: aTargetElement horizontal: self horizontalAlignment.
	aTargetElement parent layout align: aTargetElement vertical: self verticalAlignment
]

{ #category : #'api - resizers' }
BrLayoutLook >> vFitContent [
	self verticalResizer: BlLayoutResizer fitContent
]

{ #category : #'api - resizers' }
BrLayoutLook >> vMatchParent [
	self verticalResizer: BlLayoutResizer matchParent
]

{ #category : #accessing }
BrLayoutLook >> verticalAlignment [
	<return: #BlElementAlignment>
	
	^ verticalAlignment
]

{ #category : #accessing }
BrLayoutLook >> verticalAlignment: aBlElementAlignment [
	
	verticalAlignment := aBlElementAlignment.
	self updateAlignment
]

{ #category : #accessing }
BrLayoutLook >> verticalResizer [
	<return: #BlLayoutResizer>

	^ verticalResizer
]

{ #category : #accessing }
BrLayoutLook >> verticalResizer: aBlLayoutResizer [
	self
		assert: [ aBlLayoutResizer isNotNil ]
		description: [ 'Resizer must not be nil' ].
		
	verticalResizer := aBlLayoutResizer.
	self widgetDo: [ :anElement | self targetElement constraintsDo: [ :c | c vertical resizer: self verticalResizer ] ]
]

{ #category : #'api - resizers' }
BrLayoutLook >> width: aNumber [
	self horizontalResizer: (BlLayoutResizer exact: aNumber)
]
