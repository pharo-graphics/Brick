Class {
	#name : #BrExtendSelectionCommand,
	#superclass : #Object,
	#instVars : [
		'editor',
		'toSelect',
		'toDeselect'
	],
	#category : #'Brick-Editor'
}

{ #category : #accessing }
BrExtendSelectionCommand >> editor: anEditor [
	editor := anEditor
]

{ #category : #accessing }
BrExtendSelectionCommand >> initialize [
	super initialize.
	toSelect := OrderedCollection new.
	toDeselect := OrderedCollection new.
]

{ #category : #accessing }
BrExtendSelectionCommand >> toDeselect [
	^ toDeselect
]

{ #category : #accessing }
BrExtendSelectionCommand >> toDeselect: anInterval [
	toDeselect := anInterval
]

{ #category : #accessing }
BrExtendSelectionCommand >> toDeselectDo: aBlockWithOneArgument [
	toDeselect do: aBlockWithOneArgument
]

{ #category : #accessing }
BrExtendSelectionCommand >> toSelect [
	^ toSelect
]

{ #category : #accessing }
BrExtendSelectionCommand >> toSelect: anInterval [
	toSelect := anInterval
]

{ #category : #accessing }
BrExtendSelectionCommand >> toSelectDo: aBlockWithOneArgument [
	toSelect do: aBlockWithOneArgument
]
