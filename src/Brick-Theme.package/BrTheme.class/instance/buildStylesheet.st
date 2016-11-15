as yet unclassified
buildStylesheet
	| allPragmas aStylesheet |
	
	aStylesheet := self defaultStylesheet.
	allPragmas := SortedCollection
		sortBlock: [ :pr1 :pr2 | (pr1 argumentAt: 2) >= (pr2 argumentAt: 2) ].
	allPragmas
		addAll: (Pragma allNamed: #stylesheet:priority: in: self class).
	allPragmas
		do: [ :pr | 
			(Message selector: pr methodSelector argument: aStylesheet)
				sendTo: self ].
	^ aStylesheet