namespace AdventOfCode2015Tests

open Microsoft.VisualStudio.TestTools.UnitTesting
open AdventOfCode2015.Day2.Part1
open AdventOfCode2015.Day2.Part2
open System.IO

[<TestClass>]
type Day2Tests () =

    [<TestMethod>]
    member this.Day2Part1Tests() = 
        Assert.IsTrue(([|"2x3x4"|] |> CalculateWrappingSquareFeet) = 58);
        Assert.IsTrue(([|"1x1x10"|] |> CalculateWrappingSquareFeet) = 43);
        Assert.IsTrue(([|"2x3x4";"1x1x10"|] |> CalculateWrappingSquareFeet) = 101);

    [<TestMethod>]
    member this.Day2Part1() =
        let path = Path.Combine("../../../", "Day2/input")
        let content = File.ReadAllLines path
        printf $"{(content |> CalculateWrappingSquareFeet)}\n"

    [<TestMethod>]
    member this.Day2Part2Tests() = 
        Assert.IsTrue(([|"2x3x4"|] |> CalculateRibbonFeet) = 34);
        Assert.IsTrue(([|"1x1x10"|] |> CalculateRibbonFeet) = 14);
        Assert.IsTrue(([|"2x3x4";"1x1x10"|] |> CalculateRibbonFeet) = 48);

    [<TestMethod>]
    member this.Day2Part2() =
        let path = Path.Combine("../../../", "Day2/input")
        let content = File.ReadAllLines path
        printf $"{(content |> CalculateRibbonFeet)}"