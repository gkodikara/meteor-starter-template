// Schemas = {};
// Seats = new Mongo.Collection('seats');
// Flights = new Mongo.Collection('flights');

// Schemas.Seats = new SimpleSchema({
//   seatId: {
//     type: String,
//     label: "Seat",
//     max: 4
//   },
//   flightId: {
//     type: String,
//     label: "Flight ID",
//     autoform: {
//       options: function () {
//           return _.map(Flights.find(), function (c, i) {
//           console.log(c, i)
//         });
//       }
//     }
//   },
//   status: {
//     type: Boolean,
//     label: "Message",
//   }
// });

// Seats.attachSchema(Schemas.Seats)

// //... define all schemas