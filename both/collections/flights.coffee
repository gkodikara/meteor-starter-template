Schemas.Flights = new SimpleSchema 
	flightId:
		type:String
		label:'Flight ID'
		max: 10
		autoform: 
			unique: true

	flightTime:
		type:Date
		label: 'Flight Time'
		autoform:
			afFieldInput:
				type: "bootstrap-datetimepicker"

	status:
		label: 'Flight Status'
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

	owner: 
		type: String
		regEx: SimpleSchema.RegEx.Id
		autoValue: ->
			if this.isInsert
				Meteor.userId()
		autoform:
			options: ->
				_.map Meteor.users.find().fetch(), (user)->
					label: user.emails[0].address
					value: user._id

Flights.attachSchema(Schemas.Flights)