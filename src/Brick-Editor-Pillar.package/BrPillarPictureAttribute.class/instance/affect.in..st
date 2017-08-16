accessing
affect: aBrText in: aBrEditor

	^ BlElement new
		size: self image extent;
		constraintsDo: [ :c | c textFlow breakLineBefore; breakLineAfter ];
		background: (BlBackground builder image: self image; build);
		yourself