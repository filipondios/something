
data Clock = Clock Int Int
  deriving Eq

-- Create and adjust a clock. 
-- Just in case of overflow
fromHourMin :: Int -> Int -> Clock
fromHourMin hour min = addDelta 0 0 (Clock hour min)


toString :: Clock -> String
toString clock = sHour ++ ":" ++ sMinutes
  where 
    Clock hour minutes = clock
    sHour = if hour < 10 then '0' : show hour else show hour
    sMinutes = if minutes < 10 then '0' : show minutes else show minutes


addDelta :: Int -> Int -> Clock -> Clock
addDelta hour min clock = Clock newHour newMinutes
  where 
    Clock cHour cMinutes = clock
    (overflow, newMinutes) = divMod (cMinutes + min) 60
    newHour = (overflow + cHour + hour) `mod` 24
