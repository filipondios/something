namespace AdventOfCode2015Tests

open Microsoft.VisualStudio.TestTools.UnitTesting
open AdventOfCode2015.Day5.Part1
open AdventOfCode2015.Day5.Part2
open System.IO

[<TestClass>]
type Day5Tests () =

    [<TestMethod>]
    member this.Day5Part1Tests() =
        Assert.IsTrue(([|"ugknbfddgicrmopn"|] |> calculateTotalNiceStrings) = 1)
        Assert.IsTrue(([|"aaa"|] |> calculateTotalNiceStrings) = 1)
        Assert.IsTrue(([|"jchzalrnumimnmhp"|] |> calculateTotalNiceStrings) = 0)
        Assert.IsTrue(([|"haegwjzuvuyypxyu"|] |> calculateTotalNiceStrings) = 0)
        Assert.IsTrue(([|"dvszwmarrgswjxmb"|] |> calculateTotalNiceStrings) = 0)
    
    [<TestMethod>]
    member this.Day5Part1() =
        let path = Path.Combine("../../../", "Day5/input")
        let content = File.ReadAllLines path
        printf $"{(content |> calculateTotalNiceStrings)}"

    [<TestMethod>]
    member this.Day5Part2Tests() = ()
        //Assert.IsTrue((")" |> calculateBasementPosition) = 1);
        //Assert.IsTrue(("()())" |> calculateBasementPosition) = 5);

    [<TestMethod>]
    member this.Day5Part2() = ()
        //let path = Path.Combine("../../../", "Day1/input")
        //let content = File.ReadAllText path
        // No more tests here, just print
        //printf $"{(content |> calculateBasementPosition)}"
