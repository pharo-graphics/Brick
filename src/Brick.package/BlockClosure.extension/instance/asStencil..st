*Brick
asStencil: aStencilClass
	^ aStencilClass new executor: (BrStencilValuableExecutor from: self)