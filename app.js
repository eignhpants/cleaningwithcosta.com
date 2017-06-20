import express from 'express';
import path from 'path';
// import moment from 'moment';
import config from './CONFIG';

import route_handler from './routes/router'

var app = express();
app.use(express.static('public'));

app.set('views', path.join(__dirname, 'views'));
app.set('view engine', 'pug');
app.locals.config = config;

app.use('/', route_handler);

console.log('Listening on Not 3334');
app.listen(config.port);





//
// //
// // /////////////////////
// //
//
// // catch 404 and forward to error handler
// app.use(function(req, res, next) {
//   var err = new Error('Not Found');
//   err.status = 404;
//   res.render('404');
// });
//
// // error handlers
//
// // development error handler
// // will print stacktrace
// if (app.get('env') === 'development') {
//   app.use(function(err, req, res, next) {
//     res.status(err.status || 500);
//     res.render('error', {
//       message: err.message,
//       error: err
//     });
//   });
// }
//
// // production error handler
// // no stacktraces leaked to user
// app.use(function(err, req, res, next) {
//   res.status(err.status || 500);
//   res.render('error', {
//     message: err.message,
//     error: {}
//   });
// });
//
//
// app.get('/', function(req, res){
//   res.render('index', {
//     title: 'Home'
//   });
// });
//
// app.get('/about', function(req, res){
//   res.render('about', {
//     title: 'About'
//   });
// });
//
// app.get('/searching', function(req, res){
//  res.send('WHEEE');
// });
//

module.exports = app;
