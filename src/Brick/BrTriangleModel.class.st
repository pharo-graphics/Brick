Class {
	#name : #BrTriangleModel,
	#superclass : #BrWidgetModel,
	#instVars : [
		'collapsedStencil',
		'expandedStencil'
	],
	#category : #'Brick-Triangle - Model'
}

{ #category : #accessing }
BrTriangleModel >> collapsedStencil [
	^ collapsedStencil
]

{ #category : #accessing }
BrTriangleModel >> collapsedStencil: aStencil [
	collapsedStencil := aStencil.
	self notifyStencilsChanged.
]

{ #category : #defaults }
BrTriangleModel >> defaultCollapsedStencil [
	^ BrCollapsedTriangleStencil new
]

{ #category : #defaults }
BrTriangleModel >> defaultExpandedStencil [
	^ BrExpandedTriangleStencil new
]

{ #category : #accessing }
BrTriangleModel >> expandedStencil [
	^ expandedStencil
]

{ #category : #accessing }
BrTriangleModel >> expandedStencil: aStencil [
	expandedStencil := aStencil.
	self notifyStencilsChanged.
]

{ #category : #initialization }
BrTriangleModel >> initialize [
	super initialize.
	collapsedStencil := self defaultCollapsedStencil.
	expandedStencil := self defaultExpandedStencil.
]

{ #category : #initialization }
BrTriangleModel >> initializeListeners [
	super initializeListeners.
	
	self 
		when: BrTriangleStencilsRequest 
		reply: [ :aResponse | 
			aResponse 
				collapsedStencil: self collapsedStencil;
				expandedStencil: self expandedStencil ]
]

{ #category : #notifying }
BrTriangleModel >> notifyStencilsChanged [
	self dispatchEvent: (BrTriangleStencilsChanged new 
		collapsedStencil: self collapsedStencil;
		expandedStencil: self expandedStencil)
]
