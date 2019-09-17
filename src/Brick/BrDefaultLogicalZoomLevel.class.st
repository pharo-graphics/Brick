Class {
	#name : #BrDefaultLogicalZoomLevel,
	#superclass : #BrLogicalZoomLevel,
	#category : #'Brick-Logical Zooming - Model'
}

{ #category : #initialization }
BrDefaultLogicalZoomLevel >> downOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when this zoom level is deactivated"

	aFinishedBlock value
]

{ #category : #initialization }
BrDefaultLogicalZoomLevel >> upOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when this zoom level is activated"
	
	aFinishedBlock value
]
