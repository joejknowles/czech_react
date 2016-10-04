// var VerbGroup = require('./verbGroup.jsx');
// var wordPair = require('./wordPair.jsx');

var Main = React.createClass({
  getInitialState: function() {
    return { wordGroups: [] };
  },
  render: function() {
    return (
      <div className='col-md-4 top-half'>
        <button>New</button>
        <fieldset>
          <input type="text" name="pairs[][english_sentence]"/>
          <input type="text" name="pairs[][czech_sentences][]"/>
        </fieldset>
        <fieldset>
          <input type="text" name="pairs[][english_sentence]"/>
          <input type="text" name="pairs[][czech_sentences][]"/>
        </fieldset>
      </div>
    );
  }
});

        /*//{ this.state.wordGroups }*/
ReactDOM.render(
  <Main />,
  document.getElementById('container')
);

// Bundling js files together with:
// watchify public/react/Apps/Add/Add.jsx -o public/react/Apps/Add/bundle.jsx -t [ babelify --presets [ es2015 react ] ]