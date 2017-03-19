I represent an editor model. My main responsibility is provide api for modification of the editor composition model and synchronise all changes with user interface using notification mechanism.

I hold reference to a text model and provide editor scrolling element with segment holders by index. Additionally I bind editor segments to corresponding reusable segment holders that in the end update corresponding segment UI element according to data changes.

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	subject:		<MlSubject> - a subject object work on


    Implementation Points