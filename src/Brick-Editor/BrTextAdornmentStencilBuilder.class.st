"
I am a stencil builder designed to be used together with dynamic adornment attribute.

Example:
[[[
	stencilBuilder := BrTextAdornmentStencilBuilder new.
	stencilBuilder
		text: aBlText;
		editor: anEditorElement.
	adornmentElement := stencilBuilder asElement
]]]

The use of me together with adornment attribute assuming that a subclass of me is used:
[[[
	attribute := BrTextAdornmentDynamicAttribute new.
	attribute stencil: BrTextAdornmentStencilBuilder new
]]]

Users can also directly use blocks for scripting:

[[[
	attribute := BrTextAdornmentDynamicAttribute new.
	attribute stencil: [ :aText :anEditorElement | BlElement new  ]
]]]
"
Class {
	#name : #BrTextAdornmentStencilBuilder,
	#superclass : #BrStencilBuilder,
	#instVars : [
		'editorElement',
		'text'
	],
	#category : #'Brick-Editor-UI - Stencils'
}

{ #category : #'api - instantiation' }
BrTextAdornmentStencilBuilder >> buildDefault [
	^ BlElement new
		size: 20@20;
		background: Color red
]

{ #category : #accessing }
BrTextAdornmentStencilBuilder >> editor [
	<return: #BrEditorElement>

	^ editorElement
]

{ #category : #accessing }
BrTextAdornmentStencilBuilder >> editor: aBrEditorElement [
	editorElement := aBrEditorElement
]

{ #category : #'api - instantiation' }
BrTextAdornmentStencilBuilder >> paramsOn: aStencilExecutor [
	aStencilExecutor
		push: self text;
		push: self editor
]

{ #category : #accessing }
BrTextAdornmentStencilBuilder >> text [
	<return: #BlText>

	^ text
]

{ #category : #accessing }
BrTextAdornmentStencilBuilder >> text: aBlText [
	text := aBlText
]
