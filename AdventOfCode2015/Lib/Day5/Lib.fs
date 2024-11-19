namespace AdventOfCode2015

module Day5 =

  /// --- Day 5: Doesn't He Have Intern-Elves For This? ---
  ///
  /// Santa needs help figuring out which strings in his text file are naughty or
  /// nice.
  /// 
  /// A nice string is one with all of the following properties:
  /// 
  /// - It contains at least three vowels (aeiou only), like aei, xazegov, or
  ///   aeiouaeiouaeiou.
  /// - It contains at least one letter that appears twice in a row, like xx,
  ///   abcdde (dd), or aabbccdd (aa, bb, cc, or dd).
  /// - It does not contain the strings ab, cd, pq, or xy, even if they are 
  ///   part of one of the other requirements.
  ///
  /// For example:
  /// 
  /// - ugknbfddgicrmopn is nice because it has at least three vowels 
  ///   (u...i...o...), a double letter (...dd...), and none of the disallowed
  ///   substrings.
  /// - aaa is nice because it has at least three vowels and a double letter, 
  ///   even though the letters used by different rules overlap.
  /// - jchzalrnumimnmhp is naughty because it has no double letter.
  /// - haegwjzuvuyypxyu is naughty because it contains the string xy.
  /// - dvszwmarrgswjxmb is naughty because it contains only one vowel.
  /// 
  /// How many strings are nice?
  
  module Part1 = 

    let isVowel c = 
      match c with
      | 'a'
      | 'e'
      | 'i'
      | 'o'
      | 'u' -> true
      | _   -> false
  
    let isEvil pair =
      match pair with
      | ('a', 'b')
      | ('c', 'd')
      | ('p', 'q')
      | ('x', 'y') -> true 
      | _ -> false
  
    (* 3*O(n) solution :(
    let isNiceString (s: string) =
      let vowels = Regex(@"[aeiou]", RegexOptions.Compiled)
      let twice  = Regex(@"(.)\1", RegexOptions.Compiled)
      let contains = Regex(@"ab|cd|pq|xy")
      (vowels.Count(s) >= 3) && twice.IsMatch(s) && (contains.IsMatch(s) |> not)*)

    // O(n) solution 
    let isNiceString (s: string) =
      let mutable vowels = 0 
      let mutable twice = false
      let mutable evilPair = false
      let mutable i = 1
  
      if s[0] |> isVowel then
        vowels <- vowels + 1
      else ()

      while (not evilPair) && (i < s.Length) do
        let prevchar = s[i-1]
        let char = s[i]

        if char |> isVowel then
          vowels <- vowels + 1
        else ()

        if char = prevchar then 
          twice <- true 
        else 
          if isEvil (prevchar, char) then
            evilPair <- true
          else ()
        i <- i + 1
      (vowels >= 3) && twice && (not evilPair)


    let calculateTotalNiceStrings (stringList: string array) = 
      stringList |> Array.fold (fun acc (s: string) -> 
        if s |> isNiceString
          then acc + 1
          else acc
      ) 0

  module Part2 = ()
