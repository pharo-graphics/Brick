*Brick
asStencilBuilder: aStencilBuilderClass
	^ aStencilBuilderClass new executor: (BrStencilValuableExecutor from: self)