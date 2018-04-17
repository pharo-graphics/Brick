instance creation
withContainers: aCollectionOfSymbols
	^ self basicNew
		initialize;
		newContainers: aCollectionOfSymbols