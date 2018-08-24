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
	#category : 'Brick-Pager - Look'
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
	
	height := 20
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

	aPageExtent := aPageElement extent.
	aScale := aPageExtent y / self height.
	
	aPreviewExtent := aScale isZero
		ifTrue: [ 0@0 ]
		ifFalse: [ (aPageExtent / aScale) rounded ].
	
	self previewElement size: aPreviewExtent
]
