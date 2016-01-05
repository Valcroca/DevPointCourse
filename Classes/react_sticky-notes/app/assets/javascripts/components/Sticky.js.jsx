var Sticky = React.createClass({

  getInitialState: function() {
    return { stickies: this.props.stickies }
  },

  getDefaultState: function() {
    return { stickies: []}
  },

  showAddForm: function() {
    this.setState({showAdd: !this.state.showAdd});
  },

  addStickyForm: function() {
    if (this.state.showAdd) {
      return(
        <div>
          <form onSubmit={this.submitSticky}>
            <div className='input-field'>
              <input autoFocus='true' placeholder='Note:' type='text' onChange={this.addStickyNote} />
              <button className='btn waves-effect' type='submit'>Save</button>
            </div>
          </form>
        </div>
        );
    };
  },

  addStickyNote: function(e) {
    this.setState({stickyNote: e.currentTarget.value});
  },

  submitSticky: function(e) {
    e.preventDefault();
    var self = this;
    $.ajax({
      url: '/stickies',
      type: 'POST',
      data: {sticky: {note: this.state.stickyNote}},
      success: function(sticky) {
        var stickies = self.state.stickies;
        stickies.push({note: sticky.note});
        self.setState({stickies: stickies, showAdd: false, stickyNote: null});
      }
    });
  },

  displayStickies: function() {
    var stickies = [];
    for (var i = 0; i < this.state.stickies.length; i++) {
      stickies.push(
        <div className="row">
          <div className="col s12 m6">
            <div className="card yellow darken-3">
              <div className="card-action">
                <a className="btn waves-effect waves-light red right" onClick={this.destroySticky.bind(this, this.state.stickies[i].id)}>x</a>
              </div>
              <div className="card-content blue-grey-text">
                {this.state.stickies[i].note}
              </div>
            </div>
          </div>
        </div>
        );
      return stickies;
    };
  },

  destroySticky: function(stickyId) {
    var self = this;
    $.ajax({
      url: '/stickies/' + stickyId,
      type: 'DELETE',
      data: {sticky: {note: this.state}},
      success: function(stickies) {
        self.setState({stickies: stickies});
      }
    });
  },

  render: function() {
    return(
      <div>
        <h1>Sticky Notes!</h1>
        <hr />
        <a className='waves-effect waves-light green btn-large' onClick={this.showAddForm}>+</a>
        {this.addStickyForm()}
        <div className='card blue-grey darken-1'>
              <div className='card-content white-text'>
                <span className='card.title'>Your Stickies</span>  
                {this.displayStickies()}
              </div>
            </div>
      </div>
      );
  }
});