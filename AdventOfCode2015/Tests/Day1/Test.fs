namespace AdventOfCode2015Tests

open Microsoft.VisualStudio.TestTools.UnitTesting
open AdventOfCode2015.Day1.Part1
open AdventOfCode2015.Day1.Part2
open System.IO

[<TestClass>]
type Day1Tests () =

    [<TestMethod>]
    member this.Day1Part1Tests() =
        Assert.IsTrue(("(())" |> CalculateFinalFloor) = 0);
        Assert.IsTrue(("()()" |> CalculateFinalFloor) = 0);
        Assert.IsTrue(("(((" |> CalculateFinalFloor) = 3);
        Assert.IsTrue(("(()(()(" |> CalculateFinalFloor) = 3);
        Assert.IsTrue(("))(((((" |> CalculateFinalFloor) = 3);
        Assert.IsTrue(("())" |> CalculateFinalFloor) = -1);
        Assert.IsTrue(("))(" |> CalculateFinalFloor) = -1);
        Assert.IsTrue((")))" |> CalculateFinalFloor) = -3);
        Assert.IsTrue((")())())" |> CalculateFinalFloor) = -3);

    [<TestMethod>]
    member this.Day1Part1() =
        let path = Path.Combine("../../../", "Day1/input")
        let content = File.ReadAllText path
        // No more tests here, just print
        printf $"{(content |> CalculateFinalFloor)}"

    [<TestMethod>]
    member this.Day1Part2Tests() = 
        Assert.IsTrue((")" |> CalculateBasementPosition) = 1);
        Assert.IsTrue(("()())" |> CalculateBasementPosition) = 5);

    [<TestMethod>]
    member this.Day1Part2() =
        let path = Path.Combine("../../../", "Day1/input")
        let content = File.ReadAllText path
        // No more tests here, just print
        printf $"{(content |> CalculateBasementPosition)}"