"
I am the wrapper around the contents of one page, resizer and next button.
"
Class {
	#name : #BrPagerPageElement,
	#superclass : #BlElement,
	#traits : 'TBlDrawingCache',
	#classTraits : 'TBlDrawingCache classTrait',
	#instVars : [
		'weight'
	],
	#category : #'Brick-Pager - Support'
}

{ #category : #initialization }
BrPagerPageElement >> initialize [
	super initialize.
	
	self viewModel: BrPagerPageModel new.
	self beInSeparateCompositionLayer.
	weight := 0.5
]

{ #category : #layout }
BrPagerPageElement >> onMeasure: anExtentMeasurementSpec [
	| aWidthSpec aHeightSpec |
	
	aWidthSpec := anExtentMeasurementSpec widthSpec.
	aHeightSpec := anExtentMeasurementSpec heightSpec.
	
	self constraints horizontal resizer isMatchParent
		ifTrue: [ aWidthSpec := BlMeasurementSpec exact: aWidthSpec size * self weight ].

	super onMeasure: aWidthSpec @ aHeightSpec.
	
	
]

{ #category : #accessing }
BrPagerPageElement >> weight [
	<return: #Number>

	^ weight
]

{ #category : #accessing }
BrPagerPageElement >> weight: aNumber [
	weight := aNumber.
	self requestLayout
]
