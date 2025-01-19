### coin flipping simulation

coin <- c('heads', 'tails')
num_flips <- 10
flips <- sample(coin, size = num_flips, replace = TRUE)
flips

# number of heads and tails
freqs <- table(flips)
freqs

# relative frequency of heads
heads_freq <- cumsum(flips == 'heads') / 1:num_flips

# graph
plot(heads_freq,      # vector
     type = 'l',      # line type
     lwd = 2,         # width of line
     col = 'tomato',  # color of line
     las = 1,         # orientation of tick-mark labels
     ylim = c(0, 1),  # range of y-axis
     xlab = "number of tosses",    # x-axis label
     ylab = "relative frequency")  # y-axis label
abline(h = 0.5, col = 'gray50')
