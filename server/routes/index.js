var express = require('express');
var request = require('request');
//var wikipedia = require('wikipedia-js');
var router = express.Router();


var query = "Napoleon Bonaparte";
var options = {query: query, format: "html", summaryOnly: true};

/* GET home page. */
router.get('/', function(req, res, next) {
  res.render('index', { title: "Costa's Cleaning" });
});


/* GET home page. */
router.get('/about', function(req, res, next) {
  res.render('about', { title: 'About' });
});



/* GET home page. */
router.get('/sample', function(req, res, next) {
  res.send('pancakes!');
});





module.exports = router;
