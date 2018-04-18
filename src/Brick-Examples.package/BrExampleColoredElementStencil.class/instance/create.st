api - instantiation
create
	^ BlElement new
		size: 300@300;
		background: self color;
		geometry: (BlRectangle cornerRadius: self cornerRadius)