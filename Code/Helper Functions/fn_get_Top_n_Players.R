# =================================================================================== !
#
# ................ Get Top n Players ................................................
#
# =================================================================================== !


get_Top_n_Players <- function( df_Player, position, n ) {
  "
  To get the Top n Players at current position
      Input:
          -- df_Player: df of Players w/ Comp. Ratings after Conditions
          -- position:  current position
          -- n:         top n
      Output:
          -- df_Top_n:  top n Players
  "
  df_Top_n <- df_Player %>%
    arrange(desc(get(paste0('Wgted_', position)))) %>%
    select(sofifa_id, short_name, player_positions, age, 
           nationality, club, overall, potential, player_tags) %>% 
    head(n)
  return(df_Top_n)
}

