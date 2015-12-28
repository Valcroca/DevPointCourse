function pigLatin() {
  //get user input
  var str = event.currentTarget.value;
  //make and array of words
  var words = str.split(' ');
  //get first letter of each word
  var newWords = [];
  //attach first letter to end of word with 'ay'
  for(var i = 0; i < words.length; i++){
    var word = words[i];
    if(word != ''){
      var letter = word.charAt(0);
      word = word.slice(1);
      //join words back together
      word = word + letter + 'ay';
      newWords.push(word);
    }
  }

  var label = document.getElementById('pig_latin');
  label.innerHTML = newWords.join(' ');
}
