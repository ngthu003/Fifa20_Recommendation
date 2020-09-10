library(tidyverse); 


# =================================================================================== !
# :: Load data -------------------------------------------------------------------
df <- read.csv('players_20.csv', encoding = 'UTF-8')
load('Position-Attribute Df.RData')
load('Player Position Df.RData')
load('Df of All Players with Relevant Attributes.RData')


# Position dictionary ------------------------------------------------------------
source('Helper Functions/dict_Position.R')
# Compute Comprehensive Ratings --------------------------------------------------
source('Helper Functions/fn_compute_Players_Comprehensive_Ratings.R')



# :: Df of Players w/ Comprehensive Ratings --------------------------------------
df_All_Players_Comprhensive_Ratings <- data.frame(
  sofifa_id = df_All_Players_Relevant_Attr$sofifa_id,
  short_name = df_All_Players_Relevant_Attr$short_name
)

# Unweighted Comp. Ratings
df_All_Players_Comprhensive_Ratings$Un_Wgted <- 
  compute_Players_Comprehensive_Ratings('CF', df_All_Players_Relevant_Attr, FALSE)$Comp_Ratings

# Weighted Comp. Ratings, for each of the 14 on-field positions
for (i in 1:length(all_Positions)) {
  
  # Compute the Weighted Comp. Ratings for current Position
  df_All_Players_Comprhensive_Ratings$tmp <- 
    compute_Players_Comprehensive_Ratings(all_Positions[i], df_All_Players_Relevant_Attr, TRUE)$Comp_Ratings
  # Rename column
  colnames(df_All_Players_Comprhensive_Ratings)[3+i] <- paste0('Wgted_', all_Positions[i])
  
}

View(df_All_Players_Comprhensive_Ratings)








# :: Add Related Player Info -----------------------------------------------------
# str(df)
relevant_info <- c('sofifa_id', 'short_name', 'age', 'nationality', 'club', 'overall', 'potential', 
                   'player_positions', 'player_tags')
idx <- which(colnames(df) %in% relevant_info)
df_subset <- df[,idx]

# Merge 2 data frames
df_All_Players_Comprhensive_Ratings <- merge(df_subset, 
                                             df_All_Players_Comprhensive_Ratings, sort = FALSE)
View(df_All_Players_Comprhensive_Ratings)







save(df_All_Players_Comprhensive_Ratings, file 
     = 'Df of Players with Comprehensive Ratings and Relevant Info.RData')


# :: Sample ----------------------------------------------------------------------
eg <- head(df_All_Players_Comprhensive_Ratings, 50)
png('example.png', height = 50*nrow(eg), width = 200*ncol(eg))
grid.table(eg)
dev.off()










