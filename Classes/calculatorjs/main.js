
function add(){
  var inputOne = document.getElementById('input_1').value;
  var inputTwo = document.getElementById('input_2').value;
  var sum = parseInt(inputOne) + parseInt(inputTwo);
  document.getElementById('output').innerHTML = sum;
}
