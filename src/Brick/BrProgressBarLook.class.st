"
I am a basic ${class:BrProgress}$ bar look. I create a progress bar widget and keep it updated, see the ${method:BrProgressBarLook>>#onProgressChanged|label=#selector|expanded=false}$ method:

${example:BrProgressExamples>>#barOnly|codeExpanded=false|previewExpanded=true|previewHeight=180}$


"
Class {
	#name : #BrProgressBarLook,
	#superclass : #BrProgressLook,
	#instVars : [
		'container',
		'bar'
	],
	#category : #'Brick-Progress - Look'
}

{ #category : #accessing }
BrProgressBarLook >> bar [
	<return: #BlElement>
	^ bar
]

{ #category : #enumerating }
BrProgressBarLook >> barDo: aBlock [
	aBlock value: self bar
]

{ #category : #accessing }
BrProgressBarLook >> container [
	<return: #BlElement>
	^ container
]

{ #category : #enumerating }
BrProgressBarLook >> containerDo: aBlock [
	aBlock value: self container
]

{ #category : #initialization }
BrProgressBarLook >> initialize [
	super initialize.
	container := self newProgressContainerElement.
	bar := self newProgressBarElement.
	container addChild: bar.
	self addChangeAddChildAs: #(widgetContent) with: container.
]

{ #category : #'instance creation' }
BrProgressBarLook >> newProgressBarElement [
	^ BlElement new
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical exact: 5.
			c frame horizontal weight: self fraction.
			c frame horizontal alignLeft.
			c frame vertical alignCenter ]
]

{ #category : #'instance creation' }
BrProgressBarLook >> newProgressContainerElement [
	^ BlElement new
		layout: BlFrameLayout new;
		constraintsDo: [ :c | 
			c horizontal matchParent.
			c vertical fitContent ].
]

{ #category : #hooks }
BrProgressBarLook >> onProgressChanged [
	super onProgressChanged.
	self widgetDo: [ :aWidget | 
		bar constraintsDo: [ :c | 
			c frame horizontal weight: self fraction asFloat ] ]
]
