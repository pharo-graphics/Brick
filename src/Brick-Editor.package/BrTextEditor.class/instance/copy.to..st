text - copy/paste
copy: aFromIndex to: aToIndex
	"Copy text within given text interval to the clipboard"
	
	Clipboard clipboardText: (self text from: aFromIndex + 1 to: aToIndex) asString