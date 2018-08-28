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
