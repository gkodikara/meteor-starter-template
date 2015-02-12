@Config =
	name: 'HotSeat'
	title: 'HotSeat Seat Bid'
	subtitle: ''
	logo: ->
		'<b>' + @name + '</b>'
	footer: ->
		@name + ' - Copyright ' + new Date().getFullYear()
	emails:
		from: 'noreply@' + Meteor.absoluteUrl()
	blog: 'http://meteorfactory.io'
	about: 'http://meteorfactory.io'
	username: false
	homeRoute: '/'
	dashboardRoute: '/dashboard'
	socialMedia:
		facebook:
			url: 'http://facebook.com/'
			icon: 'facebook'
		twitter:
			url: 'http://twitter.com/'
			icon: 'twitter'
		github:
			url: 'http://github.com/'
			icon: 'github'
		info:
			url: 'http://meteorfactory.io'
			icon: 'link'
	publicRoutes: ['home']