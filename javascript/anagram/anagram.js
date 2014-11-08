function alphabetize(word) {
  return word.toLowerCase().split('').sort().join('');
}

function Anagram(starting_word) {
  var alphabetized_starting_word;

  starting_word = starting_word.toLowerCase();
  alphabetized_starting_word = alphabetize(starting_word);

  function is_an_anagram(other_word) {
    other_word = other_word.toLowerCase();
    return (starting_word !== other_word && alphabetized_starting_word === alphabetize(other_word));
  }
  function find_matches_among(potential_anagrams) {
    if (typeof potential_anagrams === 'string') {
      potential_anagrams = [].slice.apply(arguments);
    }
    return potential_anagrams.filter(is_an_anagram);
  }

  return {
    matches: find_matches_among
  };
}

if (module) {
  module.exports = Anagram;
}
