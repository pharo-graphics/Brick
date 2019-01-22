"
I am a text segment holder (===BrTextEditorSegment===) designed to be used by ===BrTextEditor===
"
Class {
	#name : #BrTextEditorSegmentHolder,
	#superclass : #BrEditorSegmentHolder,
	#category : 'Brick-Editor-Model - Segment-Text'
}

{ #category : #updating }
BrTextEditorSegmentHolder >> onCursorChanged [
	"Is sent when text editor's cursor changes.
	Segment holder should update text elements accordingly"
	
	self subclassResponsibility
]

{ #category : #updating }
BrTextEditorSegmentHolder >> onFocusChanged: aBoolean [
	"Is sent when text editor's focus state changes.
	Segment holder should update text elements accordingly"

	self subclassResponsibility
]

{ #category : #updating }
BrTextEditorSegmentHolder >> onSelectionChanged [
	"Is sent when text editor's selection changes.
	Segment holder should update text elements accordingly"
	
	self subclassResponsibility
]

{ #category : #updating }
BrTextEditorSegmentHolder >> onTextChanged [
	"Is sent when text changed in the editor (for example style attributes).
	Segment holder should update text elements accordingly"
	
	self subclassResponsibility
]
