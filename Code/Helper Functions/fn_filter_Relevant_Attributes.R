# =================================================================================== !
#
# ................ Get Relevant Attributes ..........................................
#
# =================================================================================== !


# :: Get Relevant Attributes -----------------------------------------------------
filter_Relevant_Attributes <- function( df_Player, df_Top_Position_per_Attribute, Attr_Other ) {
  
  "
  To select applicable Attributes for current Position
      Input:
          -- df_Player: df of Players playing a particular position
          -- df_Attributes: (= df_Top_Position_per_Attribute) list of applicable attributes
          -- Attr_Other: any other attributes
      Output:
          -- df_Player_Attr: dataframe of Attributes for Players playing a Position
  "
  
  Attr_Player <- df_Top_Position_per_Attribute$Attribute
  Attr_All <- c(Attr_Other, Attr_Player )
  
  df_Player_Attr <- df_Player[Attr_All]
  
  return(df_Player_Attr)
  
}