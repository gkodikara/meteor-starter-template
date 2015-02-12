@Schemas = {}
@Seats = new Mongo.Collection('seats');
@Flights = new Mongo.Collection('flights');

AdminConfig =
	name: Config.name
	collections : 
		Flights: {
			color: 'red'
			icon: 'plane'
			tableColumns: [
              {label: 'Flight ID',name:'flightId'}
              {label: 'Flight Time',name:'flightTime'}
            ]
		}
		Seats: {
			color: 'blue'
			icon: 'seat'
			tableColumns: [
              {label: 'Seat ID',name:'seatId'}
              {label: 'Flight ID',name:'flightId'}
            ]
		}
	dashboard:
		homeUrl: '/dashboard'
		skin: 'black'
		# widgets: [
		# 	{
		# 		template: 'adminCollectionWidget'
		# 		data:
		# 			collection: 'Posts'
		# 			class: 'col-lg-3 col-xs-6'
		# 	}
		# 	{
		# 		template: 'adminUserWidget'
		# 		data:
		# 			class: 'col-lg-3 col-xs-6'
		# 	}
		# ]
	autoForm: 
	        omitFields: ['createdAt', 'updatedAt', 'owner']

if Meteor.isClient
	window.AdminConfig = AdminConfig
else if Meteor.isServer
	global.AdminConfig = AdminConfig