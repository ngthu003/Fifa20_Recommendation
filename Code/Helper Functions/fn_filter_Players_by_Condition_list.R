# =================================================================================== !
#
# ................ Filter Players .....................................................
#
# =================================================================================== !


filter_Players_by_Condition_list <- function( df, dfPos, conditions ) {
  
  "
  To get Players satisfying the search conditions
  Input:
      -- df: df of all players
      -- dfPos: df of Player-Position
      -- conditions: list (dictionary) of conditions
  Output:
      -- df_Filtered: df of Players satisfying conditions
  "
  
  # All the IDs
  ids <- df$sofifa_id
  line <- '--------------------------------------------------------'
  
  # Loop over each condition
  for (i in 1:length(conditions)) {
    
    # if condition is POSITION --------------------------- !
    if (names(conditions)[i] == 'position') {
      if (all(conditions[[i]] %in% colnames(dfPos)) == FALSE) {
        errs <- conditions[[i]][which(!(conditions[[i]] %in% colnames(dfPos)))]
        cat(line, '\n')
        warning(paste0('One or more positions not found and thus not included.
      ..... ', paste0(errs, collapse = ', '), ' .....'))
      }
      ids_tmp <- dfPos %>%
        filter(get(conditions[[i]]) == 1) %>%
        select(sofifa_id)
    } 
    # if condition is NATIONALITY ------------------------ !
    else if (names(conditions)[i] == 'nationality') {
      nationalities <- unique(df$nationality)
      if (all(conditions[[i]] %in% nationalities) == FALSE) {
        errs <- conditions[[i]][which(!(conditions[[i]] %in% nationalities))]
        cat(line, '\n')
        warning(paste0('One or more nationalities not found and thus not included.
      ..... ', paste0(errs, collapse = ', '), ' .....'))
      }
      ids_tmp <- df %>%
        filter(nationality %in% conditions[[i]]) %>%
        select(sofifa_id)
    } 
    # if condition is AGE -------------------------------- !
    else if (names(conditions)[i] == 'age') {
      signs <- str_split(conditions[[i]], ' ')
      idx <- which(!(is.na(as.integer(signs[[1]]))))
      if ('less' %in% signs[[1]]) {
        ids_tmp <- df %>%
          filter(age <= as.integer(signs[[1]][idx])) %>%
          select(sofifa_id)
      } else if ('more' %in% signs[[1]]) {
        ids_tmp <- df %>%
          filter(age >= as.integer(signs[[1]][idx])) %>%
          select(sofifa_id)
      } else {
        cat(line, '\n')
        warning('Invalid Age condition.
      ..... Valid Age conditions: "less" or "more" .....')
      }
    }
    
    # Update with IDs from Players satisfying conditions
    ids <- intersect(ids, ids_tmp$sofifa_id)
    
  }
  
  # Filter the df based on IDs
  df_Filtered <- df %>% 
    filter(sofifa_id %in% ids)
  
  return(df_Filtered)
  
}


