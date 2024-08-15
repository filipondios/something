
data Planet = Mercury
            | Venus
            | Earth
            | Mars
            | Jupiter
            | Saturn
            | Uranus
            | Neptune

ageOn :: Planet -> Float -> Float
ageOn planet seconds = 
  case planet of
    -- = Earth years / planet_factor
    Mercury -> e_years / 0.2408467
    Venus   -> e_years / 0.61519726
    Earth   -> e_years
    Mars    -> e_years / 1.8808158
    Jupiter -> e_years / 11.862615
    Saturn  -> e_years / 29.447498
    Uranus  -> e_years / 84.016846
    Neptune -> e_years / 164.79132
  where
    e_years = seconds/31557600
