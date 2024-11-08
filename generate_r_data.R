# Set parameters
set.seed(123)  
num_individuals <- 10  
num_perceived_matrices <- 5  


friend <- matrix(sample(c(0, 1), num_individuals^2, replace = TRUE, prob = c(0.7, 0.3)), 
                 nrow = num_individuals)
friend[lower.tri(friend)] <- t(friend)[lower.tri(friend)]  
diag(friend) <- 0  


write.csv(friend, file = "friendship-maxsym_na.csv", row.names = TRUE)


for (i in 1:num_perceived_matrices) {

  perceived <- friend
  noise <- matrix(sample(c(-1, 0, 1), num_individuals^2, replace = TRUE, prob = c(0.05, 0.9, 0.05)), 
                  nrow = num_individuals)
  perceived <- perceived + noise
  perceived[perceived > 1] <- 1
  perceived[perceived < 0] <- 0
  perceived[lower.tri(perceived)] <- t(perceived)[lower.tri(perceived)]  # Keep symmetric
  diag(perceived) <- 0  

  write.csv(perceived, file = paste0(i, "_f.csv"), row.names = TRUE)
}
