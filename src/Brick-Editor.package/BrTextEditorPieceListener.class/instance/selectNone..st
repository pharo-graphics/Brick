selection handlers
selectNone: aTextEditElement
	super selectNone: aTextEditElement.
	
	"aTextEditElement selection do: [ :aMonotoneSelection |
		| aGlobalFrom aGlobalTo |

		aGlobalFrom := aTextEditElement text start + aMonotoneSelection from - 1.
		aGlobalTo := aTextEditElement text start + aMonotoneSelection to - 1.
		self editor recordDeselection: (BlTextSelection from: aGlobalFrom to: aGlobalTo) ]"