library(tidyverse); 


df <- read.csv('players_20.csv', encoding = 'UTF-8')


# Get Individual Positions -------------------------------------------------------
source('Helper Functions/fn_get_Individual_Positions.R')



# :: Get all Positions  ----------------------------------------------------------
tmp <- as.character(df$player_positions)
p_Position_list <- get_Individual_Positions(df$short_name, tmp)
# length(p_Position_list) == nrow(df)
unique_Positions <- unique(unlist(p_Position_list))
noPos <- length(unique_Positions)
print(paste0('No. of unique Positions: ', length(unique_Positions)))
unique_Positions



# :: Gather into Position Table  -------------------------------------------------
# Initialize df(Player Position)
dfPos <- data.frame(matrix(rep(0, length(p_Position_list)*(noPos+1)), 
                           ncol = noPos+1))
colnames(dfPos) <- c('Player', unique_Positions)
dfPos$Player <- names(p_Position_list)
# Populate df(Player Position) w/ 1 if Yes
for (i in 1:length(p_Position_list)){
  idx <- which(names(dfPos) %in% p_Position_list[[i]])
  dfPos[i,idx] <- 1
}
# Add player ID 
dfPos$sofifa_id <- df$sofifa_id



# :: Number of players per position ----------------------------------------------
tmp <- dfPos %>%
  select( -Player, -sofifa_id ) %>%
  select(CF, ST, RW, LW, 
         RM, LM, CAM, CM, CDM,
         RWB, LWB, RB, LB, CB, 
         GK) %>%
  apply(2, sum)
line <- '--------------------------------------------------------'
cat(line, '\n Number of Players per Position \n', line, '\n'); (tmp)
# Barplot
barplot(tmp, col = '#336699', border = NA, space = .5)





# Save dfPos
save(dfPos, file = 'Player-Position Df.RData')








