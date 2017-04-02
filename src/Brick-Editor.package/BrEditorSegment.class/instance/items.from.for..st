items - adding
items: aCollectionOfItems from: anEditorBuilder for: aSegmentValue
	"Add a collection of items associated to a given builder to this segment"
	| theItems |

	theItems := items
		at: anEditorBuilder
		ifAbsentPut: [ aSegmentValue -> (self defaultItemsCollection new: aCollectionOfItems size) ].
	
	theItems value removeAll.
	theItems value addAll: aCollectionOfItems.
	size := size + theItems value size.