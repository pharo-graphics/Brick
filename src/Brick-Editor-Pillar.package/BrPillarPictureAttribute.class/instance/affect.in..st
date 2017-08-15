accessing
affect: aBrText in: aBrEditor

	^ BlElement new
		size: self image extent;
		background: (BlBackground builder image: self image; build);
		yourself