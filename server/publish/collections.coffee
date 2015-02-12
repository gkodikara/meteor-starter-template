Meteor.publish 'posts', ->
	Posts.find()
	
Meteor.publish 'flights', ->
	Flights.find()

Meteor.publish 'attachments', ->
	Attachments.find()