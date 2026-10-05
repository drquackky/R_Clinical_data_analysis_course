# how to find our working directory 
getwd()

# read our first CSV file!
df <- read.csv(
   file = "C:/Users/symou/Desktop/course_r/dataset/df_1_dengue_cases.csv")



# ````````````````````````````````````````````````````````````````````````````````````````````````````````````
# getting to know our data
View(df)       # to see overall data
nrow(df)       # to count how many observations/rows in our df
ncol(df)       # to count how many variables/columns in our df

str(df)        # to check the structure of our df
length(df)     # when in data frame, it will count the length of column which is 16
length(df$case_id)   # when in vector, it will count the length of all value in vector which is 200

length(unique(df$case_id))

# is there any non-applicable value (N/A) in a dataset
is.na(df)

# sum the total NA value in a dataset
sum(is.na(df))

# how many NA value in each column in a dataset
colSums(is.na(df))



# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# use "$" - dollar sign to access the vector in the data frame
# df is 2 dimensional data structure, df$occupation will take 
# all value in column occupation and return vector instead

df$occupation

# unique () is a function to find a unique value in a set of value
unique(df$occupation)




# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# HOW TO SUBSET DATA

# row 1-30, column 1-4
df[1:30, 1:4]

# all rows and column 2,4,6 then store it in "df_subset" variable
df_subset <- df[ ,c(2,4,6)]
df_subset


# subset data, select all rows where column name are (caseid, sex, occupation, province)
df_subset_2 <- df[ , c("case_id", "sex", "occupation", "province")]

# this line will give the same result and easier to understand
variable <- c("case_id", "sex", "occupation", "province")
df_subset_2 <- df[ , variable]


# filter data using dollar sign "$" and square bracket "[]"
# filter the rows with female only from column sex
df_female <- df[df$sex == "Female", ]
df_female <- df[df$sex != "Male", ]


# filter data using - and condition "&"
# we want all column only the rows are female from column sex and teacher from column occupation
df[df$occupation == "Teacher" & df$sex == "Female", ]

# store them in df_sex_job object
df_sex_job <- df[df$occupation == "Teacher" & df$sex == "Female", ]
df_sex_job




# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# UNDERSTAND HOW TO USE DOLLAR SIGN $ - TO ACCESS COLUMN AS A VECTOR

# first let's create a set of variable below and store it as variable
# fav_number, name, age, marriage

# they are vector because they contain only one type of data (ex. chr, int) 
# they dont have row or column, they are just a list of value in a variable (dimensionless)
fav_number <- c("13", "21", "101", "9")
name <- c("Bank", "Lulu", "Pupe", "Nok")
age <- c(15, 16, 13, 12)
marriage <- c("No", "No", "Yes", "Yes")

# lets create a dataframe - a 2 dimensional data structure (rows-column) and store it in variable "df_2"
df_2 <- data.frame (name, age, fav_number, marriage)

# if we want to get a list of value of age from df_2 we will write dollar sign
df_2$age

# then store in variable age_list
age_list <- df_2$age
age_list


# if we want to use mathematical calculation on the numerical data, we can now pass the variable to function
# suppose we want to find the average of age
mean(age_list)    # -> 14

# to create new column using dollar $ sign, just write our variable with dollar sign 
# and name the new column and add the value
df_2$matcha_lover <- c("No", "Yes", "Yes", "No")
str(df_2)


# what if we want to find the average of the fav_number of each person in the data
mean(df_2$fav_number)  
# -> will give you warning message saying that 
# the argument is not numeric or logical
# because u cant do mathematics on data that is not numerical so we have to convert data first!





# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# CONVERTING DATA TYPE IN DATASET

# to check the data type in our dataset
str(df_2)

# as.integer() function
# we want to convert fav_number column (chracter) to (integer) using as.integer() function
df_2$fav_number               # -> u can still see the "", it is "string"
as.integer(df_2$fav_number)   # -> u can see that the "" already disappear, it is already integer

# now if we want to make change in the data we need to paste the output from as.integer to the same vector
df_2$fav_number <- as.integer(df_2$fav_number)

# now check class of fav_number
class(df_2$fav_number)     # check class or data type of `fav_number` column

# now we can find the average of fav_number
mean(df_2$fav_number)


# as.character ()
# lets convert back to character
as.character(df_2$fav_number)
df_2$fav_number <- as.character(df_2$fav_number)


# factor (x, levels = c("..."))
# lets convert the matcha_lover to factor when we want "No" as 1/reference and "Yes" as 2 
factor(df_2$matcha_lover, levels = c("No", "Yes"))
df_2$matcha_lover <- factor(df_2$matcha_lover, levels = c("No", "Yes"))



# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# STRING CONCATENATION

# Scenario 1: Mathematical operation on numerical data
x <- 4
y <- 1
x + y    # -> will return 5

# Scenario 2: Mathematical operation on string data
x <- "4"
y <- "1"
# x + y    # -> will give you error, because math does not work on the written letter

# then how do we connect two strings together
# use paste ()
x <- "Anawin"
y <- "Symoukda"
paste(x, y, sep = "-")     # return Anawin-symoukda





# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# WORKING WITH DATE DATA
# using library (lubridate)

# first we need to install package
# install.packages("lubridate")

# call a package to our working directory
library(lubridate)



# lets show you how ``date`` datatype is so important
my_dateofbirth <- "1998-04-15"   
class(my_dateofbirth)   # data type: character


today_date <- today()   # today() will return todays' date
class(today_date)       # data type: date

# lets say i want to know my age
# can i write a code like this?
# today_date - my_dateofbirth   # -> this will give you error because my_dateofbirth is not date type yet

# use function ymd() to convert to date in the format of yyyy-mm-dd
my_dateofbirth <- ymd(my_dateofbirth)

# now you can do mathematical operation on date data
today_date - my_dateofbirth         # -> this will return 10361 days
10361/365   # I AM 28 YEARS OLD!



# lets say in a data frame df, we have column birth_year, birth_month, birth_day
# how can we find the age of our patients with just these information
# we need to create a date of birth first 

# Approach 1
# paste() to connect each column together to make format yyyy-mm-dd
df$dob_1 <- paste(df$birth_year, df$birth_month, df$birth_day, sep = "-")
class(df$dob_1)  # -> data type still character

# convert it to date using ymd()
df$dob_1 <- ymd(df$dob_1)
class(df$dob_1)   # now change to date


# Approach 2 - using function make_date () from library lubridate
df$dob_2 <- make_date(
   year = df$birth_year,
   month = df$birth_month,
   day = df$birth_day
)


# now we can find the age by finding the length between date of birth and todays' date
# read more in the presentation!
df$age <- time_length(interval(df$dob_2, today()), "year")


# find out how many day does it take for patient that have first symptoms to arrive at hospital
df$visit_date <- ymd(df$visit_date)
df$symptom_onset_date <- ymd(df$symptom_onset_date)

df$day_symptoms <- df$visit_date - df$symptom_onset_date
df$day_symptoms <- as.integer(df$day_symptoms)

# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# CONTROL FLOW - IFELSE CONDITION
# singular ifelse condition
df$agegroup_1 <- ifelse(
   df$age > 35,
   "old",
   "young"
)


# multiple ifelse condition
df$agegroup_2 <- ifelse(
   df$age <= 1,
   "Infant",
   ifelse(
      df$age <= 12,
      "Children",
      ifelse(
         df$age >12 & df$age <=19,
         "Teenager",
         "Adult"
      )
   )
)

# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# EDA on continuous variable
summary(df$age)      # however only gives some of the stat number
mean(df$age)   # to find average
median(df$age) # to find the median
min(df$age)    # to find the minimum value   
max(df$age)    # to find the maximum value
sd(df$age)     # to find standard deviation

# visualization on continuous variable
# box-plot
boxplot(df$age)

# histogram
hist(df$age)


# what if we would like to do the same on other variable would you write it again all the code?
# no ! -> we will ask AI to create function for us

# create a function called stat_summary () and pass the variable "temperature
stat_summary <- function(x) {
   cat("Mean:", mean(x, na.rm = TRUE), "\n")
   cat("Median:", median(x, na.rm = TRUE), "\n")
   cat("Minimum:", min(x, na.rm = TRUE), "\n")
   cat("Maximum:", max(x, na.rm = TRUE), "\n")
   cat("Standard Deviation:", sd(x, na.rm = TRUE), "\n")
   
   boxplot(x, main = "Boxplot of Age", ylab = "Age")
}

stat_summary(df$temperature)


# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# EDA on categorical variable

# cross tabulation 2x2 - we want to know frequency of sex and age group
tb_sex_ag <- table(df$sex, df$agegroup_2)
tb_sex_ag

# add rows and columns totals
addmargins(tb_sex_ag)

# finding proportion frequency
## margin = 1 (row percentage) / margin = 2 (column percentage)
prop.table(tb_sex_ag, margin = 1) * 100

# bar plot visualization
barplot(tb_sex_ag,
        beside = TRUE,
        legend = TRUE,
        xlab = "Age-group",
        ylab = "Total number",
        main = "Age Group and Sex Distribution")


# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# Data transformation using dplyr

# install.packages("dplyr")
library(dplyr)

# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# Base R - data transformation
# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# select row and column
df_base_r <- df[1:199, c("case_id", "sex", "age", "agegroup_2", "occupation", "province", "temperature")]
# filter data
df_base_r <- df_base_r[df_base_r$sex == "Male" & df_base_r$occupation != "Teacher", ]
# create new column and ifelse control flow
df_base_r$fever <- ifelse(
   df_base_r$temperature > 37.5,
   "Have fever",
   "No fever"
)
# rename column
names(df_base_r)[names(df_base_r) == "agegroup_2"] <- "age_group"

# relocate occupation column to second position column
df_base_r <- df_base_r[, c("case_id", "occupation", "sex", "age", "age_group", "province", "temperature", "fever")]


# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# dplyr - data transformation
# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
df_dplyr <- df %>%
   # select columns
   select(case_id, sex, age, agegroup_2, occupation, province, temperature) %>%
   # select rows
   slice(1:199) %>%
   # filter data
   filter(sex == "Male" & occupation != "Teacher") %>%
   # create new column and ifelse control flow
   mutate(
      fever = case_when(
         temperature > 37.5 ~ "Have fever",
         TRUE ~ "No fever"
      )) %>%
   # rename column
   rename(age_group = agegroup_2) %>%
   # relocate column
   relocate(occupation, .after = case_id)



# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# changing from long format to wide format data
library(dplyr)
library(tidyr)

df2 <- read.csv("dataset/df_2_dengue_cases_ver1.csv")
df3 <- read.csv("dataset/df_2_dengue_cases_ver2.csv")

# approach 1: when we have two columns, and set a value in first column filled with second column
str(df2)

df_j1 <- df %>%
   left_join(df2, by = c("case_id" = "id"))

df_j1_wide <- df_j1 %>% 
   pivot_wider(
      names_from =  symptom,
      values_from = symptom_present
   )


# approach 2: we have only one column, which we will assign the value by ourselves
str(df3)

df_j2 <- df %>%
   left_join(df3, by = "case_id")

df_j2_wide <- df_j2 %>%
   pivot_wider(
      names_from = comorbidity,
      values_from = comorbidity,
      values_fn = ~1,
      values_fill = 0
   )







# ```````````````````````````````````````````````````````````````````````````````````````````````````````````
# Data visualization
library(ggplot2)

# suppose we have a lab or clinical data
df4 <- read.csv("dataset/dengue_clinical_data.csv")

df_viz <- df %>% left_join(
   df4, by = "case_id"
)

str(df_viz)

# 1. Categorical variable - bar plot
ggplot(data = df_viz,
       mapping = aes(x = agegroup_2)) +
   geom_bar()


# PLOT 1
ggplot(data = df_viz,
       aes(test_result, fill = sex)) + 
   geom_bar(position = "dodge", color = "black") +
   theme_minimal() +
   labs(
      title = "Distribution of Dengue test result across Sex",
      x = "Dengue positivity test result",
      y = "Frequency",
      subtitle = "Female has higher positive rate!",
      caption = "Datasource: Dengue study 2001-2005"
   ) + 
   scale_fill_brewer(type = "qual", palette = 1) +
   theme(
      legend.position = "top"
   )





# PLOT 2
df_viz$disease_severity <- factor(df_viz$disease_severity,
                                  levels = c("Mild", "Moderate", "Severe", "Critical"))
ggplot(df_viz,
       aes(province, fill = disease_severity)) + 
   geom_bar(color = "black") +
   theme_minimal() +
   labs(
      title = "Dengue disease severity by each province",
      x = "provinces",
      y = "count (n)",
      subtitle = "The critical severity is the least across all categories!",
      caption = "Datasource: Dengue study 2001-2005"
   ) + 
   scale_fill_brewer(palette = 7) +
   theme(
      legend.position = "top"
   ) +
   coord_flip()





# PLOT 3
data_car <- mtcars
ggplot(data_car,
       aes(x = hp, y = mpg)) + 
   
   # Confidence interval
   geom_smooth(
      method = "lm",
      se = TRUE,
      color = "steelblue",
      fill = "lightblue",
      alpha = 0.25,
      linewidth = 1.2
   ) +
   
   # Scatter points
   geom_point(
      color = "darkorange",
      size = 4,
      alpha = 0.8
   ) +
   
   labs(
      title = "Horsepower vs Fuel Efficiency",
      subtitle = "Linear relationship with 95% confidence interval",
      x = "Horsepower (hp)",
      y = "Miles per Gallon (mpg)"
   ) +
   theme_minimal() 



# PLOT 4
df_car <- mtcars

ggplot(data_car,
       aes(x = hp,
           y = mpg,
           size = wt,
           color = factor(cyl))) +
  geom_point(alpha = 0.7) +
  scale_size_continuous(range = c(3, 12)) +
  labs(
    title = "Bubble Scatter Plot of Cars",
    subtitle = "Heavier cars tend to have larger engines and more cylinders, which produce more horsepower, consume more fuel, and result in lower MPG",
    x = "Horsepower",
    y = "Miles per Gallon",
    size = "Weight",
    color = "Cylinders"
  ) +
   geom_smooth(
      aes(x = hp, y = mpg, group = 1),
      method = "lm",
      se = TRUE,
      color = "brown",
      fill = "gold",
      inherit.aes = FALSE) +
   theme_minimal()






# PLOT 5
df_diamond <- diamonds
df_diamond$cut <- factor(df_diamond$cut,
                         levels = c("Fair", "Good", "Very Good", "Premium", "Ideal"))
ggplot(df_diamond %>% sample_n(500),
       aes(carat, price, col = cut, shape = cut)) + 
   geom_point(size = 3, alpha = 0.8) +
   theme_minimal() +
   geom_rug() +
   # Regression line 
   geom_smooth( method = "lm", se = FALSE, color = "brown", aes(group = 1))+
   labs(
      title = "Diamond Carat vs. Price",
      subtitle = "Relationship between diamond size and price across different cuts",
      x = "Carat Weight",
      y = "Price (USD)",
   )



# PLOT 6
trend_viz <- read.csv("dataset/trend_viz.csv") 
str(trend_viz)

trend_viz <- trend_viz %>%
   mutate(
      location_name = factor(
         location_name,
         levels = c("Global", "High SDI", "High-middle SDI", "Middle SDI", "Low-middle SDI", "Low SDI")
      )
   )

sdi_colors <- c(
   "Global" = "#ff8c00",
   "High SDI" = "#483d8b",
   "High-middle SDI" = "#8b008b",
   "Middle SDI" = "#808080",
   "Low-middle SDI" = "#ffd707",
   "Low SDI" = "#586d32"
)


ggplot(trend_viz, aes(x = year, group = location_name)) +
   geom_line(aes(y = val, color = location_name), linewidth = 1) +
   geom_line(aes(y = lower, color = location_name), 
             linetype = "dotted", alpha = 0.7, linewidth = 1) +
   geom_line(aes(y = upper, color = location_name), 
             linetype = "dotted", alpha = 0.7, linewidth = 1) + 
   scale_color_manual(values = sdi_colors) +
   scale_x_continuous(
      breaks = seq(min(trend_viz$year),
                   max(trend_viz$year),
                       by = 1)) +
   scale_x_continuous(
      breaks = seq(min(trend_viz$year),
                   max(trend_viz$year),
                   by = 1)) +
   scale_y_continuous(n.breaks = 10 ) +
   labs(
      title = "Trend in HIV/AIDs Incidence Among Infants Under 1 Year of Age (1990–2023)",
      y = "Under-1 infant incidence rate per 100.000 "
   ) +
   theme_minimal() +
   theme(
      panel.grid.minor = element_blank(),
      axis.text.x = element_text(angle = 90, vjust = 0.5, hjust = 1),
      legend.title = element_blank(),
      legend.position = "top",
      plot.title = element_text(
         hjust = 0.5,
         face = "bold"
      )
   ) 


# PLOT 7 - platelet x age_group 2
str(df_viz)
counts <- df_viz %>%
   group_by(agegroup_2) %>%
   count()

ggplot(df_viz, aes(x = agegroup_2, y = platelet_count, fill = agegroup_2)) + 
   geom_boxplot() +
   scale_x_discrete(
      labels = paste(counts$agegroup_2, "\n n =", counts$n)
   ) +
   scale_fill_brewer(palette = "Set2") +
   labs(
      title = "Comparision of Platelets count by age group",
      x = "Age group",
      y = "Post-intervention STD awareness score (0-100)",
      fill = "Group"
   ) +
   theme_minimal()
