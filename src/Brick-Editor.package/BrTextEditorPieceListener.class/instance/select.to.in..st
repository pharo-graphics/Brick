selection handlers
select: aFromIndex to: aToIndex in: aTextEditElement
	| aGlobalFrom aGlobalTo |

	"remove previous selection"
	
	aTextEditElement selection do: [ :aMonotoneSelection |
		aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
		aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
		
		self editor recordDeselection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo) ].
	
	aGlobalFrom := aTextEditElement text start + aFromIndex - 1.
	aGlobalTo := aTextEditElement text start + aToIndex - 1.
	
	self editor recordSelection: (BlMonotoneSelection from: aGlobalFrom to: aGlobalTo)