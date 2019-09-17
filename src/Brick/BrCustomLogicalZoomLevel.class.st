Class {
	#name : #BrCustomLogicalZoomLevel,
	#superclass : #BrLogicalZoomLevel,
	#instVars : [
		'upLogic',
		'downLogic'
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
	
	upLogic := [ :aWidget :aFinishedBlock |  ].
	downLogic := [ :aWidget :aFinishedBlock |  ]
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
