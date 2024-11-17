namespace AdventOfCode2015

module Day1 =
    
    /// Santa is trying to deliver presents in a large apartment building, but he can't
    /// find the right floor - the directions he got are a little confusing. 
    /// He starts on the ground floor (floor 0) and then follows the instructions
    /// one character at a time.
    ///
    /// An opening parenthesis, (, means he should go up one floor, and a closing
    /// parenthesis, ), means he should go down one floor.

    module Part1 =
        let CalculateFinalFloor (path: string) =
            let mutable floor = 0
            for c in path do 
                match c with
                | '(' -> floor <- floor + 1
                | ')' -> floor <- floor - 1
                | _ -> ()
            floor


    /// Now, given the same instructions, find the position of the first character 
    /// that causes him to enter the basement (floor -1). The first character in 
    /// the instructions has position 1, the second character has position 2, and
    /// so on.

    module Part2 = 
        let CalculateBasementPosition (path: string) =
            let mutable position = 0
            let mutable floor = 0

            while position <= path.Length && floor >= 0 do
                match path[position] with 
                | '(' -> floor <- floor + 1
                | ')' -> floor <- floor - 1
                | _ -> ()
                position <- position + 1
            position