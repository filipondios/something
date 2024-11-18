namespace AdventOfCode2015Tests

open Microsoft.VisualStudio.TestTools.UnitTesting
open AdventOfCode2015.Day4.Part1
open AdventOfCode2015.Day4.Part2

[<TestClass>]
type Day4Tests () =

    [<TestMethod>]
    member this.Day4Part1Tests() = 
        Assert.IsTrue(("abcdef" |> mineAdventCoin) = 609043I);
        Assert.IsTrue(("pqrstuv" |> mineAdventCoin) = 1048970I);
        let result = "bgvyzdsv" |> mineAdventCoin
        printf $"{result}"

    [<TestMethod>]
    member this.Day4Part2Tests() =
      // There are no tests here 
      let result = "bgvyzdsv" |> mineAdventCoin'
      printf $"{result}"

