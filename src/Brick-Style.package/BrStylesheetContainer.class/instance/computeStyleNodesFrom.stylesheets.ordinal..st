as yet unclassified
computeStyleNodesFrom: aStyleable stylesheets: aStylesheetList ordinal: anInteger
	| styler matchedRules ordinal |
	ordinal := anInteger.
	matchedRules := SortedCollection sortBlock: [ :r1 :r2 | r1 specificity <= r2 specificity ].
	aStylesheetList addAll: aStyleable stylesheets.
	aStylesheetList do: [ :eachStylesheet | matchedRules addAll: (eachStylesheet matchingRulesFor: aStyleable) ].
	styler := aStyleable styler.
	matchedRules do: [ :r | 
			styler styles addAll:
				((r computedStyles do:[:s| s ordinal: (ordinal := ordinal +1) ]) 
					reject: [ :s | styler styles includes: s ]).
			styler transitions addAll:
				((r computedTransitions do:[:s| s ordinal: (ordinal := ordinal +1) ])
					reject: [ :t | styler transitions includes: t ]) ].
	
	aStyleable isParent ifTrue:[
		aStyleable children do: [ :eachChild | 
			styler children add: 
				(self computeStyleNodesFrom: eachChild stylesheets: aStylesheetList ordinal:ordinal) ]].
	^ styler