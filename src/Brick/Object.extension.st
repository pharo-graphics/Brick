Extension { #name : #Object }

{ #category : #'*Brick' }
Object >> asStencilBuilder [
	<return: #BrStencilBuilder>
	^ self asStencilBuilder: BrStencilBuilder
]

{ #category : #'*Brick' }
Object >> asStencilBuilder: aStencilBuilderClass [
	^ aStencilBuilderClass new executor: (BrStencilValuableExecutor from: self)
]
