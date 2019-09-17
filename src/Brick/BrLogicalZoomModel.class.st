Class {
	#name : #BrLogicalZoomModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'levels',
		'currentLevel'
	],
	#category : #'Brick-Logical Zooming - Model'
}

{ #category : #'api - adding' }
BrLogicalZoomModel >> addLevel: aZoomLevel [
	levels add: aZoomLevel.

	"the first level is always a default"
	levels size = 2
		ifTrue: [ self currentLevel: aZoomLevel ]
]

{ #category : #private }
BrLogicalZoomModel >> currentLevel: aZoomLevel [
	"Change a current zoom level to the given one"
	
	self widgetDo: [ :aWidget |
		currentLevel
			downOn: aWidget
			whenFinished: [
				aZoomLevel
					upOn: aWidget
					whenFinished: [ currentLevel := aZoomLevel ] ] ]
]

{ #category : #private }
BrLogicalZoomModel >> indexOf: aZoomLevel ifAbsent: anAbsentBlock [
	^ levels indexOf: aZoomLevel ifAbsent: anAbsentBlock
]

{ #category : #initialization }
BrLogicalZoomModel >> initialize [
	super initialize.

	currentLevel := BrDefaultLogicalZoomLevel new.
	levels := OrderedCollection with: currentLevel
]

{ #category : #'api - zooming' }
BrLogicalZoomModel >> zoomIn [
	| aCurrentZoomIndex |

	aCurrentZoomIndex := self
		indexOf: currentLevel
		ifAbsent: [ ^ self ].

	aCurrentZoomIndex >= levels size
		ifTrue: [ ^ self ].
	
	self currentLevel: (levels at: aCurrentZoomIndex + 1)
]

{ #category : #'api - zooming' }
BrLogicalZoomModel >> zoomOut [
	| aCurrentZoomIndex |

	aCurrentZoomIndex := self
		indexOf: currentLevel
		ifAbsent: [ ^ self ].

	aCurrentZoomIndex <= 1
		ifTrue: [ ^ self ].
	
	self currentLevel: (levels at: aCurrentZoomIndex - 1)
]
