Extension { #name : #BrExtendSelectionCommand }

{ #category : #'*Brick-Extensions' }
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
