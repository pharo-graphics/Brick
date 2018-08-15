api - adding / removing
removePagesAfterIndex: aPageIndex
	(self pages size to: aPageIndex by: -1) do: [ :eachIndex |
		self removePage: (self pages at: eachIndex) ]