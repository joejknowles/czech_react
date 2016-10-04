(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
"use strict";

// var VerbGroup = require('./verbGroup.jsx');
// var wordPair = require('./wordPair.jsx');

var Main = React.createClass({
  displayName: "Main",

  getInitialState: function getInitialState() {
    return { wordGroups: [] };
  },
  render: function render() {
    return React.createElement(
      "div",
      { className: "col-md-4 top-half" },
      React.createElement(
        "button",
        null,
        "New"
      ),
      React.createElement(
        "fieldset",
        null,
        React.createElement("input", { type: "text", name: "pairs[][english_sentence]" }),
        React.createElement("input", { type: "text", name: "pairs[][czech_sentences][]" })
      ),
      React.createElement(
        "fieldset",
        null,
        React.createElement("input", { type: "text", name: "pairs[][english_sentence]" }),
        React.createElement("input", { type: "text", name: "pairs[][czech_sentences][]" })
      )
    );
  }
});

/*//{ this.state.wordGroups }*/
ReactDOM.render(React.createElement(Main, null), document.getElementById('container'));

// Bundling js files together with:
// watchify public/react/Apps/Add/Add.jsx -o public/react/Apps/Add/bundle.jsx -t [ babelify --presets [ es2015 react ] ]

},{}]},{},[1]);
