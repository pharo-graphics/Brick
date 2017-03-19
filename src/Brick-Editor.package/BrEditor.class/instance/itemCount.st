accessing
itemCount
	"Return a number of in how many segments my subject can be split at this moment of time.
	(note, that amount of segments may change because of some editing or post-load actions)"
	<return: #Number>

	^ iterator segmentCount