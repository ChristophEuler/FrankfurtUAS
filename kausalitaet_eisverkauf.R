library(partykit)

# Read data
df <- read.csv("A:/bewerbungen/2019_09_HS-Frankfurt/kausalitaet/experiment/experiment/data.csv")

# View data
View(df)
dim(df)
sapply(df, typeof)
sapply(df, is.factor)

# Get data types right
df$kauf <- as.factor(df$kauf)
df$werbung <- as.factor(df$werbung)
df$monat <- as.factor(df$monat)
#df$gaesteuebernachtungen <- as.factor(df$gaesteuebernachtungen)
summary(df)

# Are there missing values?
sum(is.na(df))

# Data exploration
table(df$kauf)
table(df$werbung)
table(df$monat)
plot(density(as.numeric(df$einwohner)))
plot(density(as.numeric(df$gaesteuebernachtungen)))
plot(density(as.numeric(df$temperatur)))

# Train model
set.seed(-753)
mdl <- ctree(kauf~., data=df,
             control = ctree_control(mincriterion = 0.95))

plot(mdl,
     ep_args = list(justmin = 2), 
     gp = gpar(fontsize = 16))
