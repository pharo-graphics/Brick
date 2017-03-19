collector - testing
wantsMore
	"Return true if I still have space for more segments"
	<return: #Boolean>

	^ self segments size < self limit