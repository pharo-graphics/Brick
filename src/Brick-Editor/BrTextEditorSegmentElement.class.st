"
I am a visual element representing a segment. I am hold by SegmentHolder which binds me with a segment.

Users may customize me by changing segment's layout, margin, padding or visual properties such as background or border.

Override me for more advanced customizations
"
Class {
	#name : #BrTextEditorSegmentElement,
	#superclass : #BlElement,
	#traits : 'TBlDrawingCache',
	#classTraits : 'TBlDrawingCache classTrait',
	#instVars : [
		'cachedSurface',
		'session'
	],
	#category : #'Brick-Editor-UI'
}

{ #category : #private }
BrTextEditorSegmentElement >> cachedSurface [
	^ cachedSurface
]

{ #category : #private }
BrTextEditorSegmentElement >> cachedSurface: aSurface [
	cachedSurface := aSurface
]

{ #category : #initialization }
BrTextEditorSegmentElement >> releaseCaches [
	cachedSurface ifNotNil: #release.
	cachedSurface := nil
]

{ #category : #private }
BrTextEditorSegmentElement >> session [
	^ session
]

{ #category : #private }
BrTextEditorSegmentElement >> session: aSession [
	session := aSession
]
