Schemas.Seats = new SimpleSchema
	seatId:
		type:String
		max: 10

	status:
		type: Boolean

	createdAt: 
		type: Date
		autoValue: ->
			if this.isInsert
				new Date()

	updatedAt:
		type:Date
		optional:true
		autoValue: ->
			if this.isUpdate
				new Date()

	flightId: 
		type: String
		autoform:
			options: ->
				if Meteor.isClient
					_.map Meteor.flights.find().fetch(), (flight)->
						label: flight.flightId
						value: flight._id

Seats.attachSchema(Schemas.Seats)