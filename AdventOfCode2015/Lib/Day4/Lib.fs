namespace AdventOfCode2015
open System.Security.Cryptography
open System.Text

module Day4 =

  /// --- Day 4: The Ideal Stocking Stuffer ---
  /// 
  /// Santa needs help mining some AdventCoins (very similar to bitcoins) to use
  /// as gifts for all the economically forward-thinking little girls and boys.
  /// 
  /// To do this, he needs to find MD5 hashes which, in hexadecimal, start with 
  /// at least five zeroes. The input to the MD5 hash is some secret key (your 
  /// puzzle input, given below) followed by a number in decimal. To mine 
  /// AdventCoins, you must find Santa the lowest positive number (no leading 
  /// zeroes: 1, 2, 3, ...) that produces such a hash.
  /// 
  /// For example:
  /// 
  /// - If your secret key is abcdef, the answer is 609043, because the MD5
  ///   hash of abcdef609043 starts with five zeroes (000001dbbfa...), and it
  ///   is the lowest such number to do so.
  /// 
  /// - If your secret key is pqrstuv, the lowest number it combines with to 
  ///   make an MD5 hash starting with five zeroes is 1048970; that is, the 
  ///   MD5 hash of pqrstuv1048970 looks like 000006136ef....

  module Part1 =
    
    // Some personal notes here: 
    // This exercise expects the bytes of the MD5 digests to be represented by two
    // hexadecimal digits. For example, 0 will be 00, 8 will be 08, 255 will be ff.
    // Knowing this, to see if the first 5 digits of the resulting digest string are 
    // 0, we just have to check if the first and second bytes are 0 and if the third 
    // is less than 10 (hexadecimal) = 16 (decimal). 

    // Note that here we use 'bigint' instead of 'int64' or preferably 'uint64' to 
    // avoid overflow at the cost of performance.

    let mineAdventCoin (secretKey: string) = 
      use md5 = MD5.Create()
      let mutable found = false
      let mutable number: bigint = 0I
      
      while ``not`` found do
        let digest = 
          secretKey + (string number)
          |> Encoding.ASCII.GetBytes |> md5.ComputeHash
        
        if (digest[0] = 0uy) && (digest[1] = 0uy) && (digest[2] < 0x10uy) then 
          found <- true
        else number <- number + 1I
      number

  module Part2 = 

    let mineAdventCoin' (secretKey: string) = 
      use md5 = MD5.Create()
      let mutable found = false
      let mutable number: bigint = 0I
      
      while ``not`` found do
        let digest = 
          secretKey + (string number)
          |> Encoding.ASCII.GetBytes |> md5.ComputeHash
        
        if (digest[0] = 0uy) && (digest[1] = 0uy) && (digest[2] = 0uy) then 
          found <- true
        else number <- number + 1I
      number
