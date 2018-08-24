"
I am a visual element representing a segment. I am hold by SegmentHolder which binds me with a segment.

Users may customize me by changing segment's layout, margin, padding or visual properties such as background or border.

Override me for more advanced customizations
"
Class {
	#name : #BrTextEditorSegmentElement,
	#superclass : #BlElement,
	#instVars : [
		'cachedSurface',
		'session'
	],
	#category : 'Brick-Editor-UI'
}

{ #category : #drawing }
BrTextEditorSegmentElement >> drawMeAndChildrenOnSpartaCanvas: aCanvas [

	(session ~~ Smalltalk session or: [ cachedSurface isNil ]) ifTrue: [
		| aCachedCanvas |
		session := Smalltalk session.
		aCachedCanvas := aCanvas similar: self boundsInWindow extent ceiling asIntegerPoint.
		aCachedCanvas transform during: [ :aTransform |
			aTransform scaleBy: self space windowScale.
			aTransform apply.
			super drawMeAndChildrenOnSpartaCanvas: aCachedCanvas ].

		cachedSurface := aCachedCanvas surface.
		aCachedCanvas release ].

	aCanvas transform during: [ :aTransform |
			aTransform scaleBy: 1.0 / self space windowScale.
			aTransform apply.
			aCanvas fill
				paint: cachedSurface;
				path: cachedSurface bounds;
				draw ]
]

{ #category : #'change reporting' }
BrTextEditorSegmentElement >> invalidRect: aBlBounds from: anElement [
	super invalidRect: aBlBounds from: anElement.
	
	self releaseCaches
]

{ #category : #'children hooks' }
BrTextEditorSegmentElement >> onRemovedFromSceneGraph [
	super onRemovedFromSceneGraph.

	self releaseCaches
]

{ #category : #initialization }
BrTextEditorSegmentElement >> releaseCaches [
	cachedSurface ifNotNil: #release.
	cachedSurface := nil
]
