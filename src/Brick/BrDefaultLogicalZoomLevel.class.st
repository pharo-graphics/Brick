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
BrDefaultLogicalZoomLevel >> overridenOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when another zoom level is pushed on top of this one"

	aFinishedBlock value
]

{ #category : #initialization }
BrDefaultLogicalZoomLevel >> restoredOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when another zoom level is popped and I am again the top one"

	aFinishedBlock value
]

{ #category : #initialization }
BrDefaultLogicalZoomLevel >> upOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when this zoom level is activated"
	
	aFinishedBlock value
]
