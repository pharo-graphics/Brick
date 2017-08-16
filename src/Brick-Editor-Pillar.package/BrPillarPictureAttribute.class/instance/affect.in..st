accessing
affect: aBrText in: aBrEditor

	^ BlElement new
		size: self image extent;
		constraintsDo: [ :c | c textFlow breakLine ];
		background: (BlBackground builder image: self image; build);
		yourself