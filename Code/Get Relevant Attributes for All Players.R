library(tidyverse); 
# library(rlang)


# =================================================================================== !
# :: Load data -------------------------------------------------------------------
df <- read.csv('players_20.csv', encoding = 'UTF-8')
load('Position-Attribute Df.RData')
load('Player Position Df.RData')


# Position dictionary ------------------------------------------------------------
source('Helper Functions/dict_Position.R')
# :: Get Relevant Attributes -----------------------------------------------------
source('Helper Functions/fn_filter_Relevant_Attributes.R')


# =================================================================================== !
# :: Sample ----------------------------------------------------------------------
df_All_Players_Relevant_Attr <- filter_Relevant_Attributes(df, df_Top_Position_per_Attribute, c('short_name', 'sofifa_id'))
str(df_All_Players_Relevant_Attr)
View(df_All_Players_Relevant_Attr)

save(df_All_Players_Relevant_Attr, file = 'Df of All Players with Relevant Attributes.RData')

