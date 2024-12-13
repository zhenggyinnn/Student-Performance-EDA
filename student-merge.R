# import data
# add separate dataset ad d1 and d2
d1=read.table("student-mat.csv",sep=",",header=TRUE)
d2=read.table("student-por.csv",sep=",",header=TRUE)

# merge data that are available in both d1 and d2 as d3
d3=merge(d1,d2,by=c("school","sex","age","address","famsize","Pstatus","Medu","Fedu","Mjob","Fjob","reason","nursery","internet"), all=FALSE)

# print number of rows of data, should be 382 rows
print(nrow(d3))

# rename same attributes from math course
colnames(d3)[colnames(d3) == "guardian.x"] <- "math_guardian"
colnames(d3)[colnames(d3) == "traveltime.x"] <- "math_traveltime"
colnames(d3)[colnames(d3) == "studytime.x"] <- "math_studytime"
colnames(d3)[colnames(d3) == "failures.x"] <- "math_failures"
colnames(d3)[colnames(d3) == "schoolsup.x"] <- "math_schoolsup"
colnames(d3)[colnames(d3) == "famsup.x"] <- "math_famsup"
colnames(d3)[colnames(d3) == "schoolsup.x"] <- "math_schoolsup"
colnames(d3)[colnames(d3) == "famsup.x"] <- "math_famsup"
colnames(d3)[colnames(d3) == "paid.x"] <- "math_paid"
colnames(d3)[colnames(d3) == "freetime.x"] <- "math_freetime"
colnames(d3)[colnames(d3) == "goout.x"] <- "math_goout"
colnames(d3)[colnames(d3) == "Dalc.x"] <- "math_Dalc"
colnames(d3)[colnames(d3) == "Walc.x"] <- "math_Walc"
colnames(d3)[colnames(d3) == "health.x"] <- "math_health"
colnames(d3)[colnames(d3) == "absences.x"] <- "math_absences"
colnames(d3)[colnames(d3) == "G1.x"] <- "math_G1"
colnames(d3)[colnames(d3) == "G2.x"] <- "math_G2"
colnames(d3)[colnames(d3) == "G3.x"] <- "math_G3"
colnames(d3)[colnames(d3) == "activities.x"] <- "math_activities"
colnames(d3)[colnames(d3) == "higher.x"] <- "math_higher"
colnames(d3)[colnames(d3) == "romantic.x"] <- "math_romantic"
colnames(d3)[colnames(d3) == "famrel.x"] <- "math_famrel"

# rename same attributes from Portuguese course
colnames(d3)[colnames(d3) == "guardian.y"] <- "port_guardian"
colnames(d3)[colnames(d3) == "traveltime.y"] <- "port_traveltime"
colnames(d3)[colnames(d3) == "studytime.y"] <- "port_studytime"
colnames(d3)[colnames(d3) == "failures.y"] <- "port_failures"
colnames(d3)[colnames(d3) == "schoolsup.y"] <- "port_schoolsup"
colnames(d3)[colnames(d3) == "famsup.y"] <- "port_famsup"
colnames(d3)[colnames(d3) == "schoolsup.y"] <- "port_schoolsup"
colnames(d3)[colnames(d3) == "famsup.y"] <- "port_famsup"
colnames(d3)[colnames(d3) == "paid.y"] <- "port_paid"
colnames(d3)[colnames(d3) == "freetime.y"] <- "port_freetime"
colnames(d3)[colnames(d3) == "goout.y"] <- "port_goout"
colnames(d3)[colnames(d3) == "Dalc.y"] <- "port_Dalc"
colnames(d3)[colnames(d3) == "Walc.y"] <- "port_Walc"
colnames(d3)[colnames(d3) == "health.y"] <- "port_health"
colnames(d3)[colnames(d3) == "absences.y"] <- "port_absences"
colnames(d3)[colnames(d3) == "G1.y"] <- "port_G1"
colnames(d3)[colnames(d3) == "G2.y"] <- "port_G2"
colnames(d3)[colnames(d3) == "G3.y"] <- "port_G3"
colnames(d3)[colnames(d3) == "activities.y"] <- "port_activities"
colnames(d3)[colnames(d3) == "higher.y"] <- "port_higher"
colnames(d3)[colnames(d3) == "romantic.y"] <- "port_romantic"
colnames(d3)[colnames(d3) == "famrel.y"] <- "port_famrel"

# change nominal data to categorical data
d3$school <- as.factor(d3$school)
d3$sex <- as.factor(d3$sex)
d3$address <- as.factor(d3$address)
d3$famsize <- as.factor(d3$famsize)
d3$Pstatus <- as.factor(d3$Pstatus)
d3$Mjob <- as.factor(d3$Mjob)
d3$Fjob <- as.factor(d3$Fjob)
d3$reason <- as.factor(d3$reason)
d3$math_guardian <- as.factor(d3$math_guardian)
d3$port_guardian <- as.factor(d3$port_guardian)
d3$math_schoolsup <- as.factor(d3$math_schoolsup)
d3$port_schoolsup <- as.factor(d3$port_schoolsup)
d3$math_famsup <- as.factor(d3$math_famsup)
d3$port_famsup <- as.factor(d3$port_famsup)
d3$math_paid <- as.factor(d3$math_paid)
d3$port_paid <- as.factor(d3$port_paid)
d3$math_activities <- as.factor(d3$math_activities)
d3$port_activities <- as.factor(d3$port_activities)
d3$nursery <- as.factor(d3$nursery)
d3$math_higher <- as.factor(d3$math_higher)
d3$port_higher <- as.factor(d3$port_higher)
d3$internet <- as.factor(d3$internet)
d3$math_romantic <- as.factor(d3$math_romantic)
d3$port_romantic <- as.factor(d3$port_romantic)
d3$avg_famrel = as.numeric(d3$avg_famrel)

# export d3 data as csv file
write.csv(d3, "Student_Merged.csv")

# initial data checks
# check for missing values
is.na(d3) 
# check for sum of missing values
sum(is.na(d3))

# check for duplicates
duplicated(d3)
# check for sum of duplicated data 
sum(duplicated(d3))

# check for data types
str(d3)



# feature engineering 
# calculate average study time and insert as new column in d3 
d3$avg_studytime = rowMeans(d3[, c("math_studytime", "port_studytime")], na.rm = TRUE)
# calculate average daily alcohol consumption and insert as new column in d3 
d3$avg_Dalc = rowMeans(d3[, c("math_Dalc", "port_Dalc")], na.rm = TRUE)
# calculate average weekend alcohol consumption and insert as new column in d3 
d3$avg_Walc = rowMeans(d3[, c("math_Walc", "port_Walc")], na.rm = TRUE)
# calculate average alcohol consumption in a week and insert as new column in d3 
d3$avg_alcohol = rowMeans(d3[, c("avg_Dalc", "avg_Walc")], na.rm=TRUE)
# calculate the average family relationship for a student and insert as new column in d3
d3$avg_famrel = rowMeans(d3[, c("math_famrel", "port_famrel")], na.rm = TRUE)

# create new column to change health into categorical data
# math_health
d3$math_health_category = cut(d3$math_health, 
                              breaks = c(0, 2, 5),  # Define breaks for the categories
                              labels = c("unhealthy", "healthy"),  # Define labels
                              right = TRUE)  # Include the rightmost interval
# port_health
d3$port_health_category = cut(d3$port_health, 
                              breaks = c(0, 2, 5),  # Define breaks for the categories
                              labels = c("unhealthy", "healthy"),  # Define labels
                              right = TRUE)  # Include the rightmost interval

# check for data inconsistencies
# Install and load the package "naniar" to view missing data
install.packages("naniar")
library("naniar")
# visualize missing data
gg_miss_var(d3)
# produce heat map for missing values
vis_miss(d3)

# Identify duplicated rows by forming a data frame 
duplicated_values <- d3[duplicated(d3) | duplicated(d3, fromLast = TRUE), ]
# View the duplicated rows
print(duplicated_values)

# create value to store only categorical columns in the dataset
categorical_col = sapply(d3, function(x) is.factor(x))
# check for any unique values in all categorical columns of the dataset
unique_categorical_values = lapply(d3[, categorical_data], unique)
# Display the result
unique_categorical_values

# Report Components
# create a data frame with only numeric variables inside to calculate their key statistics
numerical_data = d3[, sapply(d3, is.numeric)]

# calculate the mean of all numerical data and show result 
mean_values = sapply(numerical_data, mean, na.rm = TRUE)
mean_values

# calculate the median of all numerical data and show result
median_values = sapply(numerical_data, median, na.rm = TRUE)
median_values

# calculate the standard deviation of all numerical data and show result
sd_values = sapply(numerical_data, sd, na.rm = TRUE)
sd_values

# calculate the range of all numerical data and show result
range_values = sapply(numerical_data, range, na.rm = TRUE)
range_values

# create a data frame with only categorical variables inside to calculate their proportions
categorical_data = sapply(d3, is.factor)

# reason of doing this is because all 24 categorical data cannot be shown at once
# create data frame to store first 12 variables to produce as a pie chart
first_12_cat_data = names(categorical_data)[1:12]

# adjust display to show 12 pie charts proportions at once
par(mfrow = c(3, 3))  
# Loop through each categorical variable and create pie charts with percentage labels for first 12 data
lapply(first_12_cat_data, function(column) {
  if (is.factor(d3[[column]]) || is.character(d3[[column]])) {  # Ensure it's a categorical variable
    counts <- table(d3[[column]])  # Get counts for each category
    percentages <- round(100 * counts / sum(counts), 1)  # Calculate percentages
    labels <- paste0(names(counts), ": ", percentages, "%")  # Labels with percentages
    
    pie(counts, labels = labels, main = paste("Pie chart of", column))
  }
})
# this execution cannot display the last eight variable, to solve this, another code is run below

# run this code separately
# define the first remaining 4 variables that are unable to produce 
specific_variables_1 = c("internet", "math_guardian", "math_schoolsup", "math_famsup")
# adjust layout
par(mfrow=c(2, 2))
# Loop through the specific variables
for (var in specific_variables_1) {
  # Create a table of counts for the current variable
  counts <- table(d3[[var]])
  # Create the pie chart
  pie(counts, main = paste("Pie chart of", var), labels = paste0(round(100 * prop.table(counts), 1), "%"))
}

# define the other remaining 4 variables that are unable to produce 
specific_variables_2 = c("math_paid", "math_activities", "math_higher", "math_romantic")
# adjust layout
par(mfrow=c(2, 2))
# Loop through the specific variables
for (var in specific_variables_2) {
  # Create a table of counts for the current variable
  counts <- table(d3[[var]])
  # Create the pie chart
  pie(counts, main = paste("Pie chart of", var), labels = paste0(round(100 * prop.table(counts), 1), "%"))
}

# Adjust layout
par(mfrow = c(3, 3)) 
# Loop through each categorical variable and create pie charts with percentage labels for last 12 data
lapply(names(d3)[categorical_data], function(column) {
  counts <- table(d3[[column]])  # Get the counts for each category
  percentages <- round(100 * counts / sum(counts), 1)  # Calculate percentages
  labels <- paste0(names(counts), ": ", percentages, "%")  # Create labels with percentages
  
  pie(counts, labels = labels, main = paste("Pie chart of", column))
})

# checking for outliers
# adjust layout to display multiple box plots at once 
par(mfrow=c(1, 1)) 

# Create box plots for each variable
boxplot(d3$avg_famrel, main = "Student's Relationship with Family", ylab = "Relationship Rank", col = "green")
boxplot(d3$avg_studytime, main = "Student's Average Study Time", ylab = "Study Time", col = "green")
boxplot(d3$avg_alcohol, main = "Student's Average Alcohol Consumption", ylab = "ALcohol Consumption", col = "green")


# produce histogram for potential imbalances
# avg_famrel
hist_avg_famrel =  hist(d3$avg_famrel, 
                   main = "Histogram of Students' Family Relationship", 
                   xlab = "Family Relationship Rank", 
                   ylab = "Frequency", 
                   col = "pink", 
                   border = "black", 
                   breaks = 5)
# Add text labels to the histogram
text(hist_avg_famrel$mids, hist_avg_famrel$counts, labels = hist_avg_famrel$counts, pos = 3, cex = 0.8, col = "black")
# avg_studytime
hist_avg_studytime =  hist(d3$avg_studytime, 
                      main = "Histogram of Students' Average Study Time", 
                      xlab = "Study Rank", 
                      ylab = "Frequency", 
                      col = "pink", 
                      border = "black", 
                      breaks = 5)
# Add text labels to the histogram
text(hist_avg_studytime$mids, hist_avg_studytime$counts, labels = hist_avg_studytime$counts, pos = 3, cex = 0.8, col = "black")
# avg_alcohol
hist_avg_alcohol =  hist(d3$avg_alcohol, 
                    main = "Histogram of Students' Average Alcohol Consumption", 
                    xlab = "Alcohol Consumption Rank", 
                    ylab = "Frequency", 
                    col = "pink", 
                    border = "black", 
                    breaks = 5)
# Add text labels to the histogram
text(hist_avg_alcohol$mids, hist_avg_alcohol$counts, labels = hist_avg_alcohol$counts, pos = 3, cex = 0.8, col = "black")


# check for categorical data imbalances using pie charts
# math_famsup
math_famsup_table = table(d3$math_famsup)
# Create the math_famsup pie chart with labels
pie(math_famsup_table, 
    main = "Pie Chart of Family Support in Math Course Students",
    col = rainbow(length(math_famsup_table)),
    labels = paste(names(math_famsup_table), 
                   round((math_famsup_table / sum(math_famsup_table)) * 100, 1), "%"))
# port_famsup
port_famsup_table = table(d3$port_famsup)
# Create the math_famsup pie chart with labels
pie(port_famsup_table, 
    main = "Pie Chart of Family Support in Portuguese Course Students",
    col = rainbow(length(port_famsup_table)),
    labels = paste(names(port_famsup_table), 
                   round((port_famsup_table / sum(port_famsup_table)) * 100, 1), "%"))
# math_health_category
math_health_category_table = table(d3$math_health_category)
# Create the math_famsup pie chart with labels
pie(math_health_category_table, 
    main = "Pie Chart of Math Course Studets' Health",
    col = rainbow(length(math_health_category_table)),
    labels = paste(names(math_health_category_table), 
                   round((math_health_category_table / sum(math_health_category_table)) * 100, 1), "%"))
# port_health_category
port_health_category_table = table(d3$port_health_category)
# Create the math_famsup pie chart with labels
pie(port_health_category_table, 
    main = "Pie Chart of Portuguese Course Studets' Health",
    col = rainbow(length(port_health_category_table)),
    labels = paste(names(port_health_category_table), 
                   round((port_health_category_table / sum(port_health_category_table)) * 100, 1), "%"))

# calculate correlation coefficient of each data to find the relationship between different variables using Pearson Method
# avg_famrel with avg_alcohol
famrel_alcohol_correlation <- cor(d3$avg_famrel, d3$avg_alcohol, method = "pearson")
famrel_alcohol_correlation
# avg_studytime with avg_alcohol
studytime_alcohol_correlation <- cor(d3$avg_studytime, d3$avg_alcohol, method = "pearson")
studytime_alcohol_correlation
# math_famrel and math_health
math_famrel_health_correlation <- cor(d3$math_famrel, d3$math_health, method = "pearson")
math_famrel_health_correlation
# port_famrel and port_health
port_famrel_health_correlation <- cor(d3$port_famrel, d3$port_health, method = "pearson")
port_famrel_health_correlation

# chi-squared test on math_famsup with math_health_category
math_chisq_test = chisq.test(table(d3$math_famsup, d3$math_health_category))
print(math_chisq_test)
# Interpretation of results through message 
if (math_chisq_test$p.value < 0.05) {
  print("Hypothesis accepted. There is a significant association between family support and health status.")
} else {
  print("Hypothesis rejected. There is no significant association between family support and health status.")
}
# chi-squared test on port_famsup with port_math_category
port_chisq_test = chisq.test(table(d3$port_famsup, d3$port_health_category))
print(port_chisq_test)
# Interpretation of results through message 
if (port_chisq_test$p.value < 0.05) {
  print("Hypothesis accepted. There is a significant association between family support and health status.")
} else {
  print("Hypothesis rejected. There is no significant association between family support and health status.")
}

# violin plot for math_famrel and math_health
# install package ggplot2
library(ggplot2)
ggplot(d3, aes(x = as.factor(math_health), y = math_famrel)) +
  geom_violin(fill = "pink", color = "black") +  # Violin plot for distribution
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) +  # Box plot for median and quartiles
  stat_summary(fun = median, geom = "point", size = 2, color = "red") +  # Red point for the median
  xlab("Health Levels") +
  ylab("Family Relationship") +
  ggtitle("Violin Plot with Box Plot: Health Levels and Family Relationship of Students in Math Course") +
  theme_minimal()

# violin plot for port_famrel and port_health
# install package ggplot2
library(ggplot2)
ggplot(d3, aes(x = as.factor(port_health), y = port_famrel)) +
  geom_violin(fill = "pink", color = "black") +  # Violin plot for distribution
  geom_boxplot(width = 0.1, fill = "white", outlier.shape = NA) +  # Box plot for median and quartiles
  stat_summary(fun = median, geom = "point", size = 2, color = "red") +  # Red point for the median
  xlab("Health Levels") +
  ylab("Family Relationship") +
  ggtitle("Violin Plot with Box Plot: Health Levels and Family Relationship of Students in Portuguese Course") +
  theme_minimal()


# Scatter plot to visualize the relationship between avg_famrel and avg_alcohol
plot(d3$avg_famrel, d3$avg_alcohol, 
     xlab = "Average Family Relationship", 
     ylab = "Average Alcohol Consumption", 
     main = "Scatter Plot of Family Relationship vs Alcohol Consumption",
     pch = 19,            
     col = "black")
# Fit a linear model
model_famrel_alcohol = lm(avg_alcohol ~ avg_famrel, data = d3)
# Add the regression line to the scatter plot
abline(model_famrel_alcohol, col = "orange", lwd = 2)
# Scatter plot to visualize the relationship between avg_studytime and avg_alcohol
plot(d3$avg_studytime, d3$avg_alcohol, 
     xlab = "Average Study Time", 
     ylab = "Average Alcohol Consumption", 
     main = "Scatter Plot of Study time vs Alcohol Consumption",
     pch = 19,            
     col = "black")
# Fit a linear model
model_studytime_alcohol = lm(avg_alcohol ~ avg_studytime, data = d3)
# Add the regression line to the scatter plot
abline(model_studytime_alcohol, col = "orange", lwd = 2)
# Create a mosaic plot for math_famsup and math_health_category
# install vcd packages first 
install.packages(vcd)
library(vcd)
mosaic(~ d3$math_famsup + d3$math_health_category, 
       data = d3,
       gp = gpar(fill = c("yellow", "orange", "green","skyblue")),
       main = "Mosaic Plot of Family Support and Health Category for Students in Math Course")
# create a mosaic plot for port_famsup and port_health_category
mosaic(~ d3$port_famsup + d3$port_health_category, 
       data = d3,
       gp = gpar(fill = c("yellow", "orange", "green","skyblue")),
       main = "Mosaic Plot of Family Support and Health Category for Students in Portuguese Course")












