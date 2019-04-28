# Load libraries - install dependencies where applicable
library(ggplot2)
library(ggforce)

# Load main celestial bodies CSV
bodies <- read_csv("bodies.csv")

# Create subset for M-type stars
mc <- subset(bodies, bodies$subType=="M (Red dwarf) Star")

# Start plotting
mg <- ggplot(mc, aes(temp, radius, color=spectralClass)) + 
  geom_point() +
  
  # Use filter to point to a specific spectral class
  geom_mark_hull(aes(filter = spectralClass == "M0",  label = spectralClass)) +
  labs(x="Temperature", y="Radius", colour="Spectral Class", title="Temperature/radius distribution in M-class stars") +
  
  # Show regression
  geom_smooth(method="lm")

# Output plot
mg