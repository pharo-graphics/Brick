tests
testPrecedence
	|ss el|
	el := BlElement new styleClass: #test.
	ss := BrStylesheet new.
	(BrStylesheetBuilder on: ss)
		cls:#test style:[:s| s declare:#color-> Color green];
		cls:#test style:[:s| s declare:#color-> Color green];
		cls:#test style:[:s| s declare:#color-> Color yellow];
		cls:#test style:[:s| s declare:#color-> Color yellow].
	el addStylesheet: ss.
	el styler compute.
	self assert: el styler styles size = 2 description: 'same styles should be excluded'.
	self assert: (el styler matchingStyleMap at:#color) value  = Color yellow description:'the last declared style should be applied'
