var VerbGroup = require('./verbGroup.jsx');
var wordPair = require('./wordPair.jsx');

var Main = React.createClass({
  getInitialState: function() {
    return { wordGroups: [VerbGroup] };
  },
  render: function() {
    return (
      <div className='col-md-4 top-half'>
        <input type="button">New</input>
        { this.state.wordGroups }
      </div>
    );
  }
});

ReactDOM.render(
  <Main />,
  document.getElementById('container')
);

// Bundling js files together with:
// watchify public/react/Apps/Add/Add.jsx -o public/react/Apps/Add/bundle.jsx -t [ babelify --presets [ es2015 react ] ]