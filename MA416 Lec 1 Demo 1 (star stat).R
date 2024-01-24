s <- c(20, 21, 20, 22, 23, 25, 25, 19, 23, 21, 22)

xbar = mean(s)
xmed = median(s)
mystarstat = sqrt(abs(xbar - xmed))/(3*var(s)+1)

nsample = 10000
mcstarstat = c()
n = length(s)
for (k in 1:nsample){
  mcS = rnorm(n, 0, 1)
  mcSStar = sqrt(abs(mean(mcS) - median(mcS)))/(3*var(mcS)+1)
  mcstarstat = c(mcstarstat, mcSStar)
}
hist(mcstarstat, breaks=100, col = 'lightgreen')

alpha = 0.05
mystarstat
starcrit = quantile(mcstarstat, 1-alpha)
starcrit
pval = mean(mcstarstat > mystarstat)
pval
hist(s, breaks = 15)

