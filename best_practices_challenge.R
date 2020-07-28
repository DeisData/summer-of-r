# REPRODUCIBILITY AND BEST PRACTICES
#
# Today's Goal:
# Turn this mess into Good Software!
#
# 1. Structure your project folder
# 2. Keep track of who wrote your code and its intended purpose
# 3. Be explicit about the requirements and dependencies of your code
# 4. Limit the “hard-coding” of the input and output files for your script.
# 5. Keep code modular
# 6. Treat data as read-only *** Prevent confusion between original and
#    cleaned datasets
# 7. Treat output generated as disposable.
# 8. Test your code




setwd('/Users/deathstar/Desktop/summer-of-r/')


# check
library(tidyverse)
input_data <- read_csv("/Users/deathstar/Desktop/summer-of-r/temp_f.csv")

# get number of samples in data
sample_number <- nrow(input_data)


# plot histogram of temperature (F) data
library(ggplot2)
ggplot(input_data) + 
  geom_histogram(aes(x=input_data$temp_f)) + 
  xlab("Temperature (F)")
ggsave('/Users/deathstar/Desktop/summer-of-r/temp_f.png', width=5, height=5)


# Convert to celsius
c <- rep(0,sample_number)
for (i in 1:sample_number){
  c[i] <- (input_data[i,1] - 32) * (5 / 9)
}
png('/Users/deathstar/Desktop/summer-of-r/temp_c.png')
hist(unlist(c), main = '', xlab='Temperature (C)', col='blue')
dev.off()

# Convert Celsius to Kelvin
library(dplyr)
input_data <- input_data %>% mutate(temp_k = ((input_data[,1] - 32) * (5 / 9)) + 273.15)


# plot the data
ggplot(input_data, aes(temp_f,temp_k$temp_f)) + 
  geom_point() +
  xlab("Temperature (F)") + 
  ylab("Temperature (K)")


# write results
write.csv(input_data, file="/Users/deathstar/Desktop/summer-of-r/temp_k.csv",
          row.names=FALSE)

