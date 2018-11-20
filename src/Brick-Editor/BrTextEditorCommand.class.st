Class {
	#name : #BrTextEditorCommand,
	#superclass : #Object,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#category : #'Brick-Editor-Commands'
}

{ #category : #executing }
BrTextEditorCommand >> executeOn: aTextEditor [
	self subclassResponsibility
]
