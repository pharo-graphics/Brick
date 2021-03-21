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
BrLogicalZoomLevel >> overridenOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when another zoom level is pushed on top of this one"

	self subclassResponsibility
]

{ #category : #initialization }
BrLogicalZoomLevel >> restoredOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when another zoom level is popped and I am again the top one"

	self subclassResponsibility
]

{ #category : #initialization }
BrLogicalZoomLevel >> upOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when this zoom level is activated"
	
	self subclassResponsibility
]
