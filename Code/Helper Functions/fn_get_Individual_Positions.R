# =================================================================================== !
#
# ................ Get Individual Positions .........................................
#
# =================================================================================== !


# :: Get Individual Positions ----------------------------------------------------
get_Individual_Positions <- function(players, strings) {
  
  "
  Input:
      -- players: names
      -- string:  string (of positions) to be extracted individually
  Output:
      -- tmp:  a list, whose each element is a (player) named vector of that player's positions
  "
  
  # Split into individual positions, separated by ',' and '_'
  tmp <- strsplit(strings, '[, [_ ]+')
  
  # Remove white space
  tmp <- lapply(tmp, function(x) gsub('^\\s+|\\s+$', '', x))
  # tmp <- lapply(tmp, function(x) gsub('#', '', x))
  # Add player name
  names(tmp) <- players
  
  return(tmp)
  
}