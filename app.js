//jshint esversion:6

const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");

const homeStartingContent = "The Japanese word shokunin is defined by both Japanese and Japanese-English dictionaries as ‘craftsman’ or ‘artisan,’ but such a literal description does not fully express the deeper meaning. The Japanese apprentice is taught that shokunin means not only having technical skills, but also implies an attitude and social consciousness. … The shokunin has a social obligation to work his/her best for the general welfare of the people. This obligation is both spiritual and material, in that no matter what it is, the shokunin’s responsibility is to fulfill the requirement.The Japanese word shokunin is defined by both Japanese and Japanese-English dictionaries as ‘craftsman’ or ‘artisan,’ but such a literal description does not fully express the deeper meaning. The Japanese apprentice is taught that shokunin means not only having technical skills, but also implies an attitude and social consciousness. … The shokunin has a social obligation to work his/her best for the general welfare of the people. This obligation is both spiritual and material, in that no matter what it is, the shokunin’s responsibility is to fulfill the requirement";
const aboutContent = "The Spirit Of The Shokunin: You owe it to the universe to SHOW UP and DO your art, CREATE your art.";
const contactContent = "When you have focused and honestly worked and played the game you were meant to, you can listen to the diffuse whispers of the Shokunin Spirit."
const app = express();

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));


app.get("/", function(req, res) {
  res.render("home", {homeStartingContent: homeStartingContent});
});

app.get("/about", function(req, res) {
  res.render("about", {aboutContent: aboutContent});
});

app.get("/contact", function(req, res) {
  res.render("contact", {contactContent: contactContent});
});











app.listen(3000, function() {
  console.log("Server started on port 3000");
});
