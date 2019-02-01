"
I am a Baseline of Brick.
"
Class {
	#name : #BaselineOfBrick,
	#superclass : #BaselineOf,
	#category : #BaselineOfBrick
}

{ #category : #baseline }
BaselineOfBrick >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'Bloc' with: [
				spec repository: 'github://feenkcom/Bloc/src' ];
			baseline: 'Beacon' with: [
				spec repository: 'github://pharo-project/pharo-beacon/repository' ].
		spec 
			package: #Brick with: [
				spec requires: #('Bloc' ). ];
			package: #'Brick-Editor' with: [
				spec requires: #('Brick' 'Beacon' ). ];
			package: #'Brick-Editor-Extensions' with: [
				spec requires: #('Brick' 'Brick-Editor' ). ];
			package: #'Brick-Material' with: [
				spec requires: #('Brick' ). ];
			package: #'Brick-Hydra' with: [
				spec requires: #('Brick' ). ];
			package: #'Brick-Glamorous' with: [
				spec requires: #('Brick' ). ];
			package: #'Brick-Examples' with: [
				spec requires: #('Brick' 'Brick-Material' 'Brick-Glamorous' 'Brick-Hydra' ). ]. ].

]
