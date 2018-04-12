api - instantiation
create
	<return: #BlElement>
	| anExecutor |
	
	anExecutor := executor.
	anExecutor resetArguments.
	self paramsOn: anExecutor.
	^ anExecutor execute