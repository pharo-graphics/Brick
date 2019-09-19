Class {
	#name : #BrLogicalZoomModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'levels'
	],
	#category : #'Brick-Logical Zooming - Model'
}

{ #category : #initialization }
BrLogicalZoomModel >> initialize [
	super initialize.

	levels := Stack with: BrDefaultLogicalZoomLevel new
]

{ #category : #notifying }
BrLogicalZoomModel >> notifyZoomPopped: aZoomLevel [
	self dispatchEvent: (BrLogicalZoomPopEvent new)
]

{ #category : #notifying }
BrLogicalZoomModel >> notifyZoomPushed: aZoomLevel [
	self dispatchEvent: (BrLogicalZoomPushEvent new)
]

{ #category : #'api - zooming' }
BrLogicalZoomModel >> popZoom [
	"Go to the previous zoom level"
	
	levels firstLink = levels lastLink
		ifTrue: [ ^ self ].
	
	self widgetDo: [ :aWidget |
		| aPreviousLevel aCurrentLevel |
		
		aPreviousLevel := levels pop.
		self notifyZoomPopped: aPreviousLevel.
		aCurrentLevel := levels top.
		
		aPreviousLevel
			downOn: aWidget
			whenFinished: [
				aCurrentLevel
					restoredOn: aWidget
					whenFinished: [  ] ] ]
]

{ #category : #'api - zooming' }
BrLogicalZoomModel >> pushZoom: aZoomLevel [
	"Change a current zoom level to the given one"
	
	self widgetDo: [ :aWidget |
		| aPreviousLevel |
		aPreviousLevel := levels top.

		levels push: aZoomLevel.
		self notifyZoomPushed: aZoomLevel.

		aPreviousLevel
			overridenOn: aWidget
			whenFinished: [
				aZoomLevel
					upOn: aWidget
					whenFinished: [  ] ] ]
]

{ #category : #'api - zooming' }
BrLogicalZoomModel >> setZoom: aZoom [
	"Replace the top zoom level with a given one"
	
	self widgetDo: [ :aWidget |
		| aPreviousLevel |
		
		aPreviousLevel := levels pop.
		levels push: aZoom.

		aPreviousLevel
			downOn: aWidget
			whenFinished: [
				aZoom
					upOn: aWidget
					whenFinished: [  ] ] ]
]

{ #category : #'api - zooming' }
BrLogicalZoomModel >> topZoom [
	<return: #BrLogicalZoomLevel>

	^ levels top
]
