evaluation
evaluate: aStream andDo: aBlock
	"Treat the current selection as an expression; evaluate it and invoke aBlock with the result."
	| result rcvr ctxt |
	
	rcvr := self doItReceiver.
	ctxt := self doItContext.
	
	result := rcvr class compiler
			source: aStream;
			context: ctxt;
			receiver: rcvr;
			requestor: self;
			failBlock:  [ ^ nil ];
			evaluate.		

	^ aBlock value: result