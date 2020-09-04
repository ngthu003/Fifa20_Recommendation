# =================================================================================== !
#
# ................ Compute Comprehensive Ratings ....................................
#
# =================================================================================== !

# :: Compute Comprehensive Ratings -----------------------------------------------
compute_Players_Comprehensive_Ratings <- function( position, df_Players, weighted ) {
  
  "
  To compute the Comprehensive Ratings of Players at current Position
      Input:
          -- position:   current position
          -- df_Players: df of players with only relevant attributes
          -- weighted:   TRUE if weight the top 5 and top 6-10 attributes per position
      Output:
          -- df_Comp_Ratings: df of 2 columns:
                              -- (1) Player: name of player
                              -- (2) Comp_Ratings: the comprehensive ratings per player
  "
  
  # 1. Prepare df to store distance
  n <- nrow(df_Players)
  df_Comp_Ratings <- data.frame(Player = df_Players$short_name,
                                Comp_Ratings = rep(0,n))
  
  
  # 2. Compute Comprehensive Ratings per Players
  # --- Get rating matrix
  ratings <- df_Players %>%
    select(-short_name, -sofifa_id) %>%
    as.matrix()
  # --- Apply Weights if applicable
  if (weighted == TRUE) {
    Attr_Top <- df_Top_Attribute_per_Position %>%
      filter(Position == position) %>% select(-Position)
    idx <- which(colnames(ratings) %in% Attr_Top[1:5])
    ratings[,idx] <- ratings[,idx]*3
    idx <- which(colnames(ratings) %in% Attr_Top[6:10])
    ratings[,idx] <- ratings[,idx]*2
  }
  # --- Sum individual ratings for Comprehensive ratings
  df_Comp_Ratings$Comp_Ratings <- ratings^2 %>% rowSums()
  
  return(df_Comp_Ratings)
  
}

