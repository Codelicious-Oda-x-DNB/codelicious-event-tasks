/**
 * @param {string} s
 * @return {number}
 */
var lengthOfLongestSubstring = function(s) {
  let charIndex = {};
  let maxLen = 0;
  let left = 0;

  for (let right = 0; right < s.length; right++) {
      if (charIndex[s[right]] !== undefined) {
          // move left pointer to the right of the previous index (if to the left of the current left position i.e. "abba")
          left = Math.max(charIndex[s[right]] + 1, left);
      }
      charIndex[s[right]] = right;
      maxLen = Math.max(maxLen, right - left + 1);
  }
  return maxLen;
};

console.log(lengthOfLongestSubstring("abcabcbb")); // Output: 3
console.log(lengthOfLongestSubstring("bbbbb")); // Output: 1
console.log(lengthOfLongestSubstring("pwwkew")); // Output: 3