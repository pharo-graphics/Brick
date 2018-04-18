building
build
	<return: #BrStencil>
	| anExecutor |
	
	anExecutor := executor.
	anExecutor resetArguments.
	self paramsOn: anExecutor.
	^ anExecutor execute