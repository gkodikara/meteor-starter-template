Router.configure
  layoutTemplate: "masterLayout"
  loadingTemplate: "loading"
  notFoundTemplate: "notFound"
  routeControllerNameConverter: "camelCase"
  onBeforeAction: ->
    if Config.username and Meteor.userId() and not Meteor.user().username
      @redirect '/setUserName'
    @next()

Router.map ->
  @route "home",
    path: "/"
    layoutTemplate: "homeLayout"
  @route "dashboard",
    path: "/dashboard"
    waitOn: ->
      [
        Meteor.subscribe 'flights'
        Meteor.subscribe 'seats'
        Meteor.subscribe 'comments'
        Meteor.subscribe 'attachments'
      ]
    onBeforeAction: ->
      url = Session.get 'redirectToAfterSignIn'
      if url
        Session.set 'redirectToAfterSignIn', null
        Router.go url
      @next()
    data: ->
      Flights: Flights.find({},{sort: {createdAt: -1}}).fetch()
  @route "profile",
    path: "/profile"
    waitOn: ->
      Meteor.subscribe 'profilePictures'
  @route "account",
    path: "/account"
    onStop: ->
      Alert.clear()
  @route "setUserName",
    path: "/setUserName"
    onBeforeAction: ->
      if not Config.username or (Meteor.userId() and Meteor.user().username)
        @redirect '/dashboard'
      @next()


Router.waitOn ->
    Meteor.subscribe 'user'
    Meteor.subscribe 'userPicture'

prepareView = ->
  window.scrollTo(0,0)
  $('body').removeClass('sidebar-active')

  #Fuck off broken modals
  $('.modal-backdrop').removeClass('in')
  $bd =  $('.modal-backdrop')
  setTimeout ->
    $bd.remove()
  , 300

  #For skrollr :(
  $('body').attr('style','')

Router.onAfterAction prepareView

#To allow non-logged in users to access more routes, add it in the config file
signInRequired = ->
  AccountsEntry.signInRequired @
  if @next
    @next()

saveRedirectUrl = ->
  unless Meteor.loggingIn()
    if not Meteor.user()
      Session.set 'redirectToAfterSignIn', @url
  @next()

publicRoutes = _.union Config.publicRoutes, ['entrySignIn','entrySignUp','entryForgotPassword']
Router.onBeforeAction saveRedirectUrl, {except: _.union publicRoutes, ['entrySignOut']}
Router.onBeforeAction signInRequired, {except: publicRoutes}

signInProhibited = ->
  if Meteor.user()
    Router.go('dashboard')
  else
    if @next
      @next()
      
Router.onBeforeAction signInProhibited, {only: ['entrySignUp','entrySignUp','entryForgotPassword']}
