api - selection
selectOne: anIndex
	"Select an item at a given index deselecting all previously selected items"
	| thePreviouslySelected |

	thePreviouslySelected := Array streamContents: [ :aStream |
		selection do: [ :aMonotoneSelection | aStream nextPut: aMonotoneSelection interval ] ].
	
	selection removeAll.
	"we must notify after actually removing all selections"
	thePreviouslySelected do: [ :anInterval | self notifyDeselected: anInterval ].

	selection select: anIndex to: anIndex.
	self notifySelected: (anIndex to: anIndex)