library(readxl)
library(openxlsx)



-
friend <- as.matrix(read.csv("friendship-maxsym_na.csv", header = TRUE, row.names = 1))

perceived_files <- list.files(pattern = "^\\d+_f\\.csv$")
perceived_networks <- lapply(perceived_files, function(file) as.matrix(read.csv(file, header = TRUE, row.names = 1)))


calculate_comparisons <- function(friend, perceived) {
  list(
    friend1 = friend - perceived,
    friend2 = friend + perceived
  )
}


friend1_list <- list()
friend2_list <- list()


for (i in seq_along(perceived_networks)) {
  if (!all(dim(friend) == dim(perceived_networks[[i]]))) {
    stop(paste("Dimension mismatch in matrix:", perceived_files[i]))
  }
  comparisons <- calculate_comparisons(friend, perceived_networks[[i]])
  friend1_list[[paste0("f", i)]] <- comparisons$friend1
  friend2_list[[paste0("f", i)]] <- comparisons$friend2
}


write_to_excel <- function(data_list, filename) {
  wb <- createWorkbook()
  for (i in seq_along(data_list)) {
    addWorksheet(wb, sheetName = names(data_list)[i])
    writeData(wb, sheet = names(data_list)[i], data_list[[i]])
  }
  saveWorkbook(wb, filename, overwrite = TRUE)
}

write_to_excel(friend1_list, "friend1_R_maxmax.xlsx")
write_to_excel(friend2_list, "friend2_R_maxmax.xlsx")
