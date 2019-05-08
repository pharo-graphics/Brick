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
		'session',
		'damageReported'
	],
	#category : #'Brick-Editor-UI'
}

{ #category : #'private - accessing' }
BrTextEditorSegmentElement >> cachedSurface [
	^ cachedSurface
]

{ #category : #'private - accessing' }
BrTextEditorSegmentElement >> cachedSurface: aSurface [
	cachedSurface := aSurface
]

{ #category : #'private - accessing' }
BrTextEditorSegmentElement >> damageReported [
	^ damageReported
]

{ #category : #'private - accessing' }
BrTextEditorSegmentElement >> damageReported: aBoolean [
	damageReported := aBoolean
]

{ #category : #'private - accessing' }
BrTextEditorSegmentElement >> session [
	^ session
]

{ #category : #'private - accessing' }
BrTextEditorSegmentElement >> session: aSession [
	session := aSession
]
