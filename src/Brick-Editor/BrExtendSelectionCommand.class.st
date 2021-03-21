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
BrExtendSelectionCommand >> gtLiveFor: aView [
	<gtView>
	| textToDisplay |
	textToDisplay := editor text asString asRopedText.
	toSelect
		do: [ :eachToSelect | 
			(textToDisplay from: eachToSelect from to: eachToSelect to)
				attributes: {(BlTextHighlightAttribute new paint: (Color green darker alpha: 0.3))} ].
	toDeselect
		do: [ :eachToDeselect | 
			(textToDisplay from: eachToDeselect from to: eachToDeselect to)
				attributes: {(BlTextUnderlineAttribute new color: (Color red alpha: 0.7))} ].
	^ aView textEditor
		title: 'Selections';
		text: textToDisplay
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
