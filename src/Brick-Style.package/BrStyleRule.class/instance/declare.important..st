as yet unclassified
declare: anAssoc important: aBoolean
	self declarations
		add:
			(BrStylePropertyDeclaration new
				property: anAssoc key;
				value: anAssoc value asBrStyleValue;
				rule: self;
				important: aBoolean;
				yourself)