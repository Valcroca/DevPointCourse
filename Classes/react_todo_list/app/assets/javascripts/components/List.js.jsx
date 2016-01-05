var List = React.createClass({
  getInitialState: function() {
    return { items: [] }; 
  },

  componentDidMount: function() {
    this.refreshList();
  },

  refreshList: function() {
    var self = this;
    $.ajax({
      url: '/items',
      type: 'GET',
      success: function(data) {
        self.setState({items: data});
      }
    });
  },

  showAddForm: function() {
    this.setState({showAdd: !this.state.showAdd});
  },

  addItemName: function(e) {
    this.setState({itemName: e.currentTarget.value});
  },

  addItemForm: function() {
    if (this.state.showAdd) {
      return( <div>
                <form onSubmit={this.submitItem}>
                  <div className='input-field'>
                    <input autoFocus='true' placeholder='Item Name' type='text' onChange={this.addItemName} />
                    <button className='btn waves-effect' type='submit'>Save</button>
                  </div>
                </form>
              </div>)
    };
  },

  submitItem: function(e) {
    e.preventDefault();
    var self = this;
    $.ajax({
      url: '/items',
      type: 'POST',
      data: {item: {name: this.state.itemName}},
      success: function(item) {
        var items = self.state.items;
        items.push(item);
        self.setState({items: items, showAdd: false, itemName: null});
      }
    });
  },

  displayItems: function() {
    var items = [];
    for(var i = 0; i < this.state.items.length; i++){
      var item = this.state.items[i];
      var key = "Item-" + item.id;
      items.push(<Item refreshList={this.refreshList} key={key} id={item.id} name={item.name} complete={item.complete} />);
    }
    return items;
  },

  render: function() {
    return(<div>
            <a className='waves-effect waves-light btn' onClick={this.showAddForm}>Add Item</a>
            {this.addItemForm()}
            <div className='card blue-grey darken-1'>
              <div className='card-content white-text'>
                <span className='card.title'>To Do </span>  
                <ul>{this.displayItems()}</ul>
              </div>
            </div>
           </div>);
  }
});