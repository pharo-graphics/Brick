displaying
maximize
	self resizable
		ifFalse: [ ^ self ].
		
	self constraints vertical resizer ifMatchParent: [ 
			self relocate: previousPosition.
			self root extent: previousRootExtent.
			self constraints horizontal fitContent.
			^ self constraints vertical fitContent ];
		ifFitContent: [ 
			previousRootExtent := self root extent.
			previousPosition := self position.
			self relocate: 0@0.
			self root constraints horizontal matchParent.
			self root constraints vertical matchParent.
			self constraints horizontal matchParent.
			^ self constraints vertical matchParent]