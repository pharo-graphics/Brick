"
I update the size of a page preview element in a scroll bar according to the size of a corresponding page
"
Class {
	#name : #BrPagerPagePreviewResizeListener,
	#superclass : #BlElementEventListener,
	#instVars : [
		'previewElement',
		'height'
	],
	#category : #'Brick-Pager - Look'
}

{ #category : #'element handlers' }
BrPagerPagePreviewResizeListener >> elementExtentChanged: anEvent [
	self updateSizeFrom: anEvent currentTarget
]

{ #category : #accessing }
BrPagerPagePreviewResizeListener >> height [
	^ height
]

{ #category : #accessing }
BrPagerPagePreviewResizeListener >> height: anObject [
	height := anObject
]

{ #category : #initialization }
BrPagerPagePreviewResizeListener >> initialize [
	super initialize.
	
	height := 10
]

{ #category : #'api - hooks' }
BrPagerPagePreviewResizeListener >> onInstalledIn: aPageElement [
	super onInstalledIn: aPageElement.
	
	self updateSizeFrom: aPageElement
]

{ #category : #accessing }
BrPagerPagePreviewResizeListener >> previewElement [
	^ previewElement
]

{ #category : #accessing }
BrPagerPagePreviewResizeListener >> previewElement: anObject [
	previewElement := anObject
]

{ #category : #'element handlers' }
BrPagerPagePreviewResizeListener >> updateSizeFrom: aPageElement [
	| aPageExtent aScale aPreviewExtent |

	aPageExtent := aPageElement extent max: 1@1.
	aScale := (aPageExtent y / 10).
	
	self
		assert: [ aScale isZero not ]
		description: [ 'Scale must not be zero' ].
	
	aScale < 1
		ifTrue: [
			aScale := 1.
			aPageExtent := self height asPoint ].

	aPreviewExtent := (aPageExtent / aScale).
	aPreviewExtent := ((aPreviewExtent x / (aPreviewExtent y / self height)) @ self height) ceiling.

	self
		assert: [ aPreviewExtent isIntegerPoint ]
		description: [ 'Extent must be an integer point' ].
	
	self previewElement size: aPreviewExtent
]
