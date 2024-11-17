namespace AdventOfCode2015Tests

open Microsoft.VisualStudio.TestTools.UnitTesting
open AdventOfCode2015.Day3.Part1
open AdventOfCode2015.Day3.Part2
open System.IO

[<TestClass>]
type Day3Tests () =

    [<TestMethod>]
    member this.Day3Part1Tests() = 
        Assert.IsTrue((">" |> calculateVisitedHouses) = 2);
        Assert.IsTrue(("^>v<" |> calculateVisitedHouses) = 4);
        Assert.IsTrue(("^v^v^v^v^v" |> calculateVisitedHouses) = 2);

    [<TestMethod>]
    member this.Day3Part1() =
        let path = Path.Combine("../../../", "Day3/input")
        let content = File.ReadAllText path
        printf $"{(content |> calculateVisitedHouses)}\n"

    [<TestMethod>]
    member this.Day3Part2Tests() =
        Assert.IsTrue(("^v" |> calculateVisitedHousesWithRobo) = 3);
        Assert.IsTrue(("^>v<" |> calculateVisitedHousesWithRobo) = 3);
        Assert.IsTrue(("^v^v^v^v^v" |> calculateVisitedHousesWithRobo) = 11);

    [<TestMethod>]
    member this.Day3Part2() =
        let path = Path.Combine("../../../", "Day3/input")
        let content = File.ReadAllText path
        printf $"{(content |> calculateVisitedHousesWithRobo)}"