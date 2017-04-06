as yet unclassified
resize: anImageFile
  "Resize an image at a given path to be 200x200
  and save the result as a .png file in the same
  folder as original one. 
	
  If initial image is not proportional to resulting
  size it will be scaled as example shows:
  file:///users/syrel/Desktop/Demo/resize-example.jpg"
	
  | parentFolder originalImage resizedImage |

  parentFolder := anImageFile parent.
  originalImage := Form fromFileNamed: anImageFile.

  resizedImage := originalImage scaledToSize: 200@200.
  resizedImage writePNGFileNamed:
		anImageFile base, '_200x200.png'.

  ^ resizedImage