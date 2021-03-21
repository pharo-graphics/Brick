Class {
	#name : #BrCustomLogicalZoomLevel,
	#superclass : #BrLogicalZoomLevel,
	#instVars : [
		'upLogic',
		'downLogic',
		'overridenLogic',
		'restoredLogic'
	],
	#category : #'Brick-Logical Zooming - Model'
}

{ #category : #navigating }
BrCustomLogicalZoomLevel >> down: aBlock [
	downLogic := aBlock
]

{ #category : #initialization }
BrCustomLogicalZoomLevel >> downOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when this zoom level is deactivated"

	downLogic value: aWidget value: aFinishedBlock
]

{ #category : #initialization }
BrCustomLogicalZoomLevel >> initialize [
	super initialize.
	
	upLogic := [ :aWidget :aFinishedBlock | aFinishedBlock value ].
	downLogic := [ :aWidget :aFinishedBlock | aFinishedBlock value ].
	overridenLogic := [ :aWidget :aFinishedBlock | aFinishedBlock value ].
	restoredLogic := [ :aWidget :aFinishedBlock | aFinishedBlock value ].
]

{ #category : #navigating }
BrCustomLogicalZoomLevel >> overriden: aBlock [
	overridenLogic := aBlock
]

{ #category : #initialization }
BrCustomLogicalZoomLevel >> overridenOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when another zoom level is pushed on top of this one"

	overridenLogic value: aWidget value: aFinishedBlock
]

{ #category : #navigating }
BrCustomLogicalZoomLevel >> restored: aBlock [
	restoredLogic := aBlock
]

{ #category : #initialization }
BrCustomLogicalZoomLevel >> restoredOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when another zoom level is popped and I am again the top one"

	restoredLogic value: aWidget value: aFinishedBlock
]

{ #category : #navigating }
BrCustomLogicalZoomLevel >> up: aBlock [
	upLogic := aBlock
]

{ #category : #initialization }
BrCustomLogicalZoomLevel >> upOn: aWidget whenFinished: aFinishedBlock [
	"Is sent when this zoom level is activated"
	
	upLogic value: aWidget value: aFinishedBlock
]
