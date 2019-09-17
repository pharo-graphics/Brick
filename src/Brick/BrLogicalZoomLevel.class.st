Class {
	#name : #BrLogicalZoomLevel,
	#superclass : #Object,
	#category : #'Brick-Logical Zooming - Model'
}

{ #category : #initialization }
BrLogicalZoomLevel >> downOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when this zoom level is deactivated"

	self subclassResponsibility
]

{ #category : #initialization }
BrLogicalZoomLevel >> upOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when this zoom level is activated"
	
	self subclassResponsibility
]
