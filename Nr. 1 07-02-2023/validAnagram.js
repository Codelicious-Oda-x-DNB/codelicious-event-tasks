/**
 * @param {string} s
 * @param {string} t
 * @return {boolean}
 */
var isAnagram = function(s, t) {
  let count = new Array(26).fill(0);
  if (s.length != t.length) {
      return false;
  }
  for (let i = 0; i < s.length; i++) {
      count[s.charCodeAt(i) - 'a'.charCodeAt(0)] += 1;
  }

  for (let i = 0; i < t.length; i++) {
      count[t.charCodeAt(i) - 'a'.charCodeAt(0)] -= 1;
  }

 for (const item of count) {
     if (item !== 0) {
         return false;
      }
 }
 return true;
};