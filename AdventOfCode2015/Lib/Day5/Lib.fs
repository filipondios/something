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


  /// --- Part Two ---
  ///
  /// Realizing the error of his ways, Santa has switched to a better model of 
  /// determining whether a string is naughty or nice. None of the old rules 
  /// apply, as they are all clearly ridiculous.
  /// 
  /// Now, a nice string is one with all of the following properties:
  /// 
  /// - It contains a pair of any two letters that appears at least twice in
  ///   the string without overlapping, like xyxy (xy) or aabcdefgaa (aa), but 
  ///   not like aaa (aa, but it overlaps).
  /// - It contains at least one letter which repeats with exactly one letter
  ///   between them, like xyx, abcdefeghi (efe), or even aaa.
  ///
  /// For example:
  /// - qjhvhtzxzqqjkmpb is nice because is has a pair that appears twice (qj) 
  ///   and a letter that repeats with exactly one letter between them (zxz).
  /// - xxyxx is nice because it has a pair that appears twice and a letter 
  ///   that repeats with one between, even though the letters used by each 
  ///   rule overlap.
  /// - uurcxstgmygtbstg is naughty because it has a pair (tg) but no repeat 
  ///   with a single letter between them.
  /// - ieodomkazucvgmuy is naughty because it has a repeating letter with one
  ///   between (odo), but no pair that appears twice.
  
  module Part2 = 

    let isNiceString' (s: string) =
      let mutable pairs: Set<char*char> = Set.empty;
      let mutable lastPair = ('@','@')
      let mutable rule2 = false;
      let mutable rule1 = false;
      let mutable i = 1

      while i <= s.Length - 1 do 
        let pair = (s[i-1], s[i])

        if (not rule1) && (pair <> lastPair) then
          if pairs.Contains(pair) then
            rule1 <- true
          else 
            pairs <- pairs.Add(pair)
        lastPair <- pair

        if (i < s.Length - 1) && (s[i-1] = s[i+1]) then
          rule2 <- true
        i <- i + 1
      rule1 && rule2

    let calculateTotalNiceStrings' (stringList: string array) = 
      stringList |> Array.fold (fun acc (s: string) -> 
        if s |> isNiceString'
          then acc + 1
          else acc
      ) 0

