items - adding
items: aCollectionOfItems from: aBuilder
	"Add a collection of items associated to a given builder to this segment"
	| theItems |

	theItems := items
		at: aBuilder
		ifAbsentPut: [ self defaultItemsCollection new: aCollectionOfItems size ].
	
	theItems addAll: aCollectionOfItems.
	size := size + theItems size.