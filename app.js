//jshint esversion:6

const express = require("express");
const bodyParser = require("body-parser");
const ejs = require("ejs");
const _ = require("lodash");
const mongoose = require("mongoose");
mongoose.connect("mongodb+srv://dthink:test123@cluster0-dgosb.mongodb.net/jiroblog?retryWrites=true", {useNewUrlParser: true});


const postSchema = {
  title: String,
  content: String
};

const Post = mongoose.model("Post", postSchema);
var posts =
[
  { title: 'Day 1',
    content: 'Did some web dev basics, Javascript, Even Handlers, simple Games, JQuery Abstraction over JS' },
  { title: 'Day 2',
    content: 'Recursion Once Again Today' },
  { title: 'Day 3',
    content: 'Flight Today! So watched Awesome Stories. \nKind of saw Bahubaali Director. Decided to build JMessenger. Databases. Sample Space, Random Events, Mathusiasm' },
  { title: 'Day 18',
    content: "Built a Sudoku AI/Solver using Recursion/Backtracking/ExhaustiveSearch<br>Did some web design (spidey:) and web Development using MongoDB->mongooseODM, ExpressJS, NodeJS (and Front-End stuff as well)<br>Use Case Diagrams (Imtiaz), Came up with Alexa/Google-Home/Homepod Idea and absorbed some cool ads like Coke-v-Pepsi/Mac-v-PC/Win10-v-MacOSX, Discussed Graphic Design Freelance Work and Youtube Channel Strategy, Understood a little bit of TCP/IP Suite and Assembly Programming with ADC SBB Commands" },
];
// Post.insertMany(posts, function (err) {
//   if (err) {
//     console.log(err);
//   } else {
//     console.log("Successfully Inserted Posts");
//   }
// });


const homeStartingContent = "The Japanese word shokunin is defined by both Japanese and Japanese-English dictionaries as ‘craftsman’ or ‘artisan,’ but such a literal description does not fully express the deeper meaning. The Japanese apprentice is taught that shokunin means not only having technical skills, but also implies an attitude and social consciousness. … The shokunin has a social obligation to work his/her best for the general welfare of the people. This obligation is both spiritual and material, in that no matter what it is, the shokunin’s responsibility is to fulfill the requirement.The Japanese word shokunin is defined by both Japanese and Japanese-English dictionaries as ‘craftsman’ or ‘artisan,’ but such a literal description does not fully express the deeper meaning. The Japanese apprentice is taught that shokunin means not only having technical skills, but also implies an attitude and social consciousness. … The shokunin has a social obligation to work his/her best for the general welfare of the people. This obligation is both spiritual and material, in that no matter what it is, the shokunin’s responsibility is to fulfill the requirement";
const aboutContent = "The Spirit Of The Shokunin: You owe it to the universe to SHOW UP and DO your art, CREATE your art.";
const contactContent = "When you have focused and honestly worked and played the game you were meant to, you can listen to the diffuse whispers of the Shokunin Spirit."



const app = express();

app.set('view engine', 'ejs');

app.use(bodyParser.urlencoded({extended: true}));
app.use(express.static("public"));


app.get("/", function(req, res) {
  Post.find({}, function(err, posts) {
    if(!err)
    {
      res.render("home", {
        homeStartingContent: homeStartingContent,
        _:_,
        posts: posts
        });
    }
  });
});

app.get("/posts/:postName", function (req, res) {
  // console.log(req.params.postName);

  // SEARCHING THRUGH THE POSTS array
  // posts.forEach(function (post) {
  //   if ( _.lowerCase(req.params.postName) === _.lowerCase(post.title) ) {
  //     console.log(req.params.postName);
  //     res.render("post", {post: post});
  //     return; // FIGURE OUT WHY THIS DOES NOT break out of loop OR HAS NO USE!!!
  //   }
  //   else {
  //     console.log("No Match Found " + post.title )
  //   }
  // });
  var string = _.lowerCase(req.params.postName);
  var regex = new RegExp(["^", string, "$"].join(""), "i");
  Post.findOne({title: regex}, function(err, post) {
    if (!err) {
      res.render("post", {post: post});
    }
    else {
      // TODO A BUG HERE coz return EMPTY table so You Have To Explicitly Check
      console.log("No Match Found");
    }
  });
});


app.get("/about/", function(req, res) {
  res.render("about", {aboutContent:  aboutContent});
});


app.get("/about/:stuff", function(req, res) {
  res.render("about", {aboutContent: (req.params.stuff + " " + aboutContent)});
});

app.get("/contact", function(req, res) {
  res.render("contact", {contactContent: contactContent});
});



app.get("/compose", function(req, res) {
  res.render("compose");
});


app.post("/compose", function(req, res){
  const post = new Post({
    title: req.body.postTitle,
    content: req.body.postBody
  });
  post.save(function(err){
    if (!err) {
      res.redirect("/");
    }
  });
                  //posts.push(post);
                  //console.log(posts);

  //BUG : YOU MUST DO IT INSIDE CALLBACK:: res.redirect("/");
});







app.listen(4000, function() {
  console.log("Server started on port 3000");
});
