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
	#category : #'Brick-Editor-UI'
}

{ #category : #'as yet unclassified' }
BrTextEditorSegmentElement >> wantsCompositionLayer [
	^ true
]
