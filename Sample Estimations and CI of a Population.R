# ── Q1: Critical z-value for 88% confidence level ──────────────────────────

conf_level <- 0.88
alpha      <- 1 - conf_level        # 0.12
alpha_2    <- alpha / 2             # 0.06
z_critical <- qnorm(1 - alpha_2)

cat("Confidence level :", conf_level * 100, "%\n")
cat("Alpha/2          :", alpha_2, "\n")
cat("Critical z-value :", round(z_critical, 4), "\n")


# ── Visual ──────────────────────────────────────────────────────────────────
x <- seq(-4, 4, length.out = 1000)
y <- dnorm(x)

plot(x, y, type = "l", lwd = 2, col = "steelblue",
     main = "Critical z-value | 88% Confidence Level",
     xlab = "z", ylab = "Density", bty = "n")

# Shade confidence region (green)
x_mid <- x[x >= -z_critical & x <= z_critical]
polygon(c(-z_critical, x_mid, z_critical), c(0, dnorm(x_mid), 0),
        col = rgb(0.2, 0.7, 0.3, 0.4), border = NA)

# Shade rejection tails (red)
x_left  <- x[x <= -z_critical]
x_right <- x[x >= z_critical]
polygon(c(x_left, -z_critical),  c(dnorm(x_left),  0), col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)
polygon(c(z_critical, x_right),  c(0, dnorm(x_right)), col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)

# Critical value lines
abline(v = c(-z_critical, z_critical), col = "red", lwd = 2, lty = 2)

# Labels
text(0,  0.2,  paste0(conf_level*100, "%"), col = "darkgreen", cex = 1.3, font = 2)
text( z_critical + 0.4, 0.05, paste0("z = +", round(z_critical, 2)), col = "red", cex = 0.9)
text(-z_critical - 0.4, 0.05, paste0("z = -", round(z_critical, 2)), col = "red", cex = 0.9)
text( 3.2, 0.15, "6%", col = "red", cex = 0.9)
text(-3.2, 0.15, "6%", col = "red", cex = 0.9)


# ── Q2: Confidence Interval | Population SD known (Z-interval) ─────────────

# ── Given data ──────────────────────────────────────────────────────────────
n          <- 50        # sample size
x_bar      <- 3.97     # sample mean (hours)
sigma      <- 1.62     # population standard deviation (known)
conf_level <- 0.90     # confidence level

# ── (a) Critical z-value ────────────────────────────────────────────────────
alpha      <- 1 - conf_level        # 0.10
alpha_2    <- alpha / 2             # 0.05
z_critical <- qnorm(1 - alpha_2)    # qnorm(0.95)

cat("=== PART (a) ===\n")
cat("Critical z-value :", round(z_critical, 3), "\n\n")

# ── (b) Confidence Interval ─────────────────────────────────────────────────
SE         <- sigma / sqrt(n)       # Standard Error
margin     <- z_critical * SE       # Margin of Error

lower      <- x_bar - margin
upper      <- x_bar + margin

cat("=== PART (b) ===\n")
cat("Standard Error   :", round(SE, 4), "\n")
cat("Margin of Error  :", round(margin, 4), "\n")
cat("90% CI           : (", round(lower, 2), ",", round(upper, 2), ")\n")

# ── Visual ───────────────────────────────────────────────────────────────────
x <- seq(-4, 4, length.out = 1000)
y <- dnorm(x)

plot(x, y, type = "l", lwd = 2, col = "steelblue",
     main = "90% Confidence Interval | Z-distribution",
     xlab = "z", ylab = "Density", bty = "n")

x_mid   <- x[x >= -z_critical & x <= z_critical]
x_left  <- x[x <= -z_critical]
x_right <- x[x >= z_critical]

polygon(c(-z_critical, x_mid, z_critical), c(0, dnorm(x_mid), 0),
        col = rgb(0.2, 0.7, 0.3, 0.4), border = NA)
polygon(c(x_left, -z_critical), c(dnorm(x_left), 0),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)
polygon(c(z_critical, x_right), c(0, dnorm(x_right)),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)

abline(v = c(-z_critical, z_critical), col = "red", lwd = 2, lty = 2)

text(0,   0.20, "90%",                          col = "darkgreen", cex = 1.3, font = 2)
text( 3,  0.15, "5%",                           col = "red",       cex = 0.9)
text(-3,  0.15, "5%",                           col = "red",       cex = 0.9)
text( z_critical + 0.15, 0.05, paste0("+", round(z_critical, 3)), col = "red", cex = 0.85)
text(-z_critical - 0.15, 0.05, paste0("-", round(z_critical, 3)), col = "red", cex = 0.85)


# ── Q3: Critical t-value | 98% CI, n = 17 ──────────────────────────────────

# ── Given data ──────────────────────────────────────────────────────────────
conf_level <- 0.98      # confidence level
n          <- 17        # sample size
df         <- n - 1     # degrees of freedom = 16

# ── Critical t-value ────────────────────────────────────────────────────────
alpha      <- 1 - conf_level        # 0.02
alpha_2    <- alpha / 2             # 0.01
t_critical <- qt(1 - alpha_2, df)   # qt() = inverse of t-distribution

cat("Confidence level :", conf_level * 100, "%\n")
cat("Sample size (n)  :", n, "\n")
cat("Degrees of freedom:", df, "\n")
cat("Alpha/2          :", alpha_2, "\n")
cat("Critical t-value :", round(t_critical, 3), "\n")

# ── Visual ───────────────────────────────────────────────────────────────────
x <- seq(-4, 4, length.out = 1000)
y <- dt(x, df)                      # t-distribution with df=16

plot(x, y, type = "l", lwd = 2, col = "steelblue",
     main = paste0("Critical t-value | 98% CI | df = ", df),
     xlab = "t", ylab = "Density", bty = "n")

x_mid   <- x[x >= -t_critical & x <= t_critical]
x_left  <- x[x <= -t_critical]
x_right <- x[x >= t_critical]

polygon(c(-t_critical, x_mid, t_critical), c(0, dt(x_mid, df), 0),
        col = rgb(0.2, 0.7, 0.3, 0.4), border = NA)
polygon(c(x_left, -t_critical), c(dt(x_left, df), 0),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)
polygon(c(t_critical, x_right), c(0, dt(x_right, df)),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)

abline(v = c(-t_critical, t_critical), col = "red", lwd = 2, lty = 2)

text(0,  0.20, "98%",                              col = "darkgreen", cex = 1.3, font = 2)
text( 3,  0.15, "1%",                              col = "red",       cex = 0.9)
text(-3,  0.15, "1%",                              col = "red",       cex = 0.9)
text( t_critical + 0.2, 0.05, paste0("+", round(t_critical, 3)), col = "red", cex = 0.85)
text(-t_critical - 0.2, 0.05, paste0("-", round(t_critical, 3)), col = "red", cex = 0.85)

# ── Q4 (re-run): CI written as  ___ < µ < ___ ───────────────────────────────

# ── Given data ──────────────────────────────────────────────────────────────
n          <- 14
x_bar      <- 41
s          <- 10
conf_level <- 0.98

# ── Critical t-value ────────────────────────────────────────────────────────
df         <- n - 1
alpha      <- 1 - conf_level
alpha_2    <- alpha / 2
t_critical <- qt(1 - alpha_2, df)

# ── Confidence Interval ──────────────────────────────────────────────────────
SE     <- s / sqrt(n)
margin <- t_critical * SE
lower  <- x_bar - margin
upper  <- x_bar + margin

# ── Output in the exact format the question asks ─────────────────────────────
cat("=== ANSWER ===\n")
cat(round(lower, 1), "< µ <", round(upper, 1), "\n")


# ── Q5: Sample Size Calculation | σ known ────────────────────────────────────

# ── Given data ───────────────────────────────────────────────────────────────
sigma      <- 5         # population standard deviation
E          <- 2         # margin of error (within 2 decisions)
conf_level <- 0.90      # confidence level

# ── (a) Critical z-value ─────────────────────────────────────────────────────
alpha      <- 1 - conf_level        # 0.10
alpha_2    <- alpha / 2             # 0.05
z_critical <- qnorm(1 - alpha_2)    # qnorm(0.95)

cat("=== PART (a) ===\n")
cat("Critical z-value :", round(z_critical, 3), "\n\n")

# ── (b) Sample Size ───────────────────────────────────────────────────────────
# Formula: n = (z * sigma / E)^2
n_raw      <- (z_critical * sigma / E)^2   # exact value (decimal)
n_required <- ceiling(n_raw)               # ALWAYS round UP

cat("=== PART (b) ===\n")
cat("n (exact)        :", round(n_raw, 4), "\n")
cat("n (rounded UP)   :", n_required, "\n")

# ── Visual ────────────────────────────────────────────────────────────────────
x <- seq(-4, 4, length.out = 1000)
y <- dnorm(x)

plot(x, y, type = "l", lwd = 2, col = "steelblue",
     main = "90% CI | Sample Size Calculation",
     xlab = "z", ylab = "Density", bty = "n")

x_mid   <- x[x >= -z_critical & x <= z_critical]
x_left  <- x[x <= -z_critical]
x_right <- x[x >= z_critical]

polygon(c(-z_critical, x_mid, z_critical), c(0, dnorm(x_mid), 0),
        col = rgb(0.2, 0.7, 0.3, 0.4), border = NA)
polygon(c(x_left, -z_critical), c(dnorm(x_left), 0),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)
polygon(c(z_critical, x_right), c(0, dnorm(x_right)),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)

abline(v = c(-z_critical, z_critical), col = "red", lwd = 2, lty = 2)

text(0,   0.20, "90%",                                     col = "darkgreen", cex = 1.3, font = 2)
text( 3,   0.15, "5%",                                     col = "red",       cex = 0.9)
text(-3,   0.15, "5%",                                     col = "red",       cex = 0.9)
text( z_critical + 0.2, 0.05, paste0("+", round(z_critical, 3)), col = "red", cex = 0.85)
text(-z_critical - 0.2, 0.05, paste0("-", round(z_critical, 3)), col = "red", cex = 0.85)
mtext(paste0("Required sample size: n = ", n_required),
      side = 3, line = 0.3, cex = 1.1, col = "darkblue", font = 2)


# ── Q6: CI | n=27, x̄=30, s=18 | 80% | σ unknown → use T ────────────────────

# ── Given data ───────────────────────────────────────────────────────────────
n          <- 27
x_bar      <- 30
s          <- 18
conf_level <- 0.80

# ── Critical t-value ─────────────────────────────────────────────────────────
df         <- n - 1                 # degrees of freedom = 26
alpha      <- 1 - conf_level        # 0.20
alpha_2    <- alpha / 2             # 0.10
t_critical <- qt(1 - alpha_2, df)   # t where 90% is to the left

cat("=== SETUP ===\n")
cat("df               :", df, "\n")
cat("Alpha/2          :", alpha_2, "\n")
cat("Critical t-value :", round(t_critical, 3), "\n\n")

# ── Confidence Interval ───────────────────────────────────────────────────────
SE     <- s / sqrt(n)
margin <- t_critical * SE
lower  <- x_bar - margin
upper  <- x_bar + margin

cat("=== RESULTS ===\n")
cat("Standard Error   :", round(SE, 4), "\n")
cat("Margin of Error  :", round(margin, 4), "\n")
cat("80% CI           :", round(lower, 1), "< µ <", round(upper, 1), "\n")

# ── Visual ────────────────────────────────────────────────────────────────────
x <- seq(-4, 4, length.out = 1000)
y <- dt(x, df)

plot(x, y, type = "l", lwd = 2, col = "steelblue",
     main = paste0("80% CI | t-distribution | df = ", df),
     xlab = "t", ylab = "Density", bty = "n")

x_mid   <- x[x >= -t_critical & x <= t_critical]
x_left  <- x[x <= -t_critical]
x_right <- x[x >= t_critical]

polygon(c(-t_critical, x_mid, t_critical), c(0, dt(x_mid, df), 0),
        col = rgb(0.2, 0.7, 0.3, 0.4), border = NA)
polygon(c(x_left, -t_critical), c(dt(x_left, df), 0),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)
polygon(c(t_critical, x_right), c(0, dt(x_right, df)),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)

abline(v = c(-t_critical, t_critical), col = "red", lwd = 2, lty = 2)

text(0,   0.20, "80%",                                      col = "darkgreen", cex = 1.3, font = 2)
text( 3,   0.12, "10%",                                     col = "red",       cex = 0.9)
text(-3,   0.12, "10%",                                     col = "red",       cex = 0.9)
text( t_critical + 0.2, 0.04, paste0("+", round(t_critical, 3)), col = "red", cex = 0.85)
text(-t_critical - 0.2, 0.04, paste0("-", round(t_critical, 3)), col = "red", cex = 0.85)
mtext(paste0("CI: ", round(lower,1), " < µ < ", round(upper,1)),
      side = 3, line = 0.3, cex = 1.1, col = "darkgreen", font = 2)


# ── Q7: CI | Ruthenium | σ known → Z | + Sample Size ─────────────────────────

# ── Given data ────────────────────────────────────────────────────────────────
n          <- 22
x_bar      <- 117.2
sigma      <- 5.7       # population SD known → Z
conf_level <- 0.95

# ═══════════════════════════════════════════════════════════════════════════════
# PART (a) Critical z-value
# ═══════════════════════════════════════════════════════════════════════════════
alpha      <- 1 - conf_level        # 0.05
alpha_2    <- alpha / 2             # 0.025
z_critical <- qnorm(1 - alpha_2)    # qnorm(0.975)

cat("=== PART (a) ===\n")
cat("Critical z-value :", round(z_critical, 3), "\n\n")

# ═══════════════════════════════════════════════════════════════════════════════
# PART (b) Margin of Error
# ═══════════════════════════════════════════════════════════════════════════════
SE     <- sigma / sqrt(n)
E      <- z_critical * SE

cat("=== PART (b) ===\n")
cat("Standard Error   :", round(SE, 4), "\n")
cat("Margin of Error E:", round(E, 2), "μg\n\n")

# ═══════════════════════════════════════════════════════════════════════════════
# PART (c) Confidence Interval
# ═══════════════════════════════════════════════════════════════════════════════
lower <- x_bar - E
upper <- x_bar + E

cat("=== PART (c) ===\n")
cat("95% CI           :", round(lower, 2), "< µ <", round(upper, 2), "μg\n\n")

# ═══════════════════════════════════════════════════════════════════════════════
# PART (d) Interpretation
# ═══════════════════════════════════════════════════════════════════════════════
cat("=== PART (d) ===\n")
cat("✅ We are 95% confident that the TRUE MEAN Ruthenium used\n")
cat("   falls between", round(lower,2), "and", round(upper,2), "μg\n\n")

# ═══════════════════════════════════════════════════════════════════════════════
# PART (e) New critical z for 99% CI
# ═══════════════════════════════════════════════════════════════════════════════
conf_level2 <- 0.99
alpha2      <- 1 - conf_level2      # 0.01
alpha2_2    <- alpha2 / 2           # 0.005
z_critical2 <- qnorm(1 - alpha2_2)  # qnorm(0.995)

cat("=== PART (e) ===\n")
cat("Critical z (99%) :", round(z_critical2, 3), "\n\n")

# ═══════════════════════════════════════════════════════════════════════════════
# PART (f) Required sample size
# ═══════════════════════════════════════════════════════════════════════════════
E2        <- 1.45                           # within 1.45 μg
n_raw     <- (z_critical2 * sigma / E2)^2
n_required <- ceiling(n_raw)

cat("=== PART (f) ===\n")
cat("n (exact)        :", round(n_raw, 4), "\n")
cat("n (rounded UP)   :", n_required, "\n\n")

# ── Visual ────────────────────────────────────────────────────────────────────
par(mfrow = c(1, 2))   # two plots side by side

# Plot 1: 95% CI
x <- seq(-4, 4, length.out = 1000)
y <- dnorm(x)

plot(x, y, type = "l", lwd = 2, col = "steelblue",
     main = "95% CI | Z-distribution",
     xlab = "z", ylab = "Density", bty = "n")

x_mid   <- x[x >= -z_critical & x <= z_critical]
x_left  <- x[x <= -z_critical]
x_right <- x[x >= z_critical]

polygon(c(-z_critical, x_mid, z_critical), c(0, dnorm(x_mid), 0),
        col = rgb(0.2, 0.7, 0.3, 0.4), border = NA)
polygon(c(x_left, -z_critical), c(dnorm(x_left), 0),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)
polygon(c(z_critical, x_right), c(0, dnorm(x_right)),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)

abline(v = c(-z_critical, z_critical), col = "red", lwd = 2, lty = 2)
text(0,  0.20, "95%",  col = "darkgreen", cex = 1.2, font = 2)
text( 3,  0.15, "2.5%", col = "red",       cex = 0.9)
text(-3,  0.15, "2.5%", col = "red",       cex = 0.9)
mtext(paste0(round(lower,2), " < µ < ", round(upper,2)),
      side = 3, line = 0.3, cex = 0.95, col = "darkgreen", font = 2)

# Plot 2: 99% CI
plot(x, y, type = "l", lwd = 2, col = "steelblue",
     main = "99% CI | Sample Size",
     xlab = "z", ylab = "Density", bty = "n")

x_mid2   <- x[x >= -z_critical2 & x <= z_critical2]
x_left2  <- x[x <= -z_critical2]
x_right2 <- x[x >= z_critical2]

polygon(c(-z_critical2, x_mid2, z_critical2), c(0, dnorm(x_mid2), 0),
        col = rgb(0.2, 0.5, 0.9, 0.4), border = NA)
polygon(c(x_left2, -z_critical2), c(dnorm(x_left2), 0),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)
polygon(c(z_critical2, x_right2), c(0, dnorm(x_right2)),
        col = rgb(0.9, 0.2, 0.2, 0.4), border = NA)

abline(v = c(-z_critical2, z_critical2), col = "red", lwd = 2, lty = 2)
text(0,  0.20, "99%",  col = "darkblue",  cex = 1.2, font = 2)
text( 3,  0.15, "0.5%", col = "red",       cex = 0.9)
text(-3,  0.15, "0.5%", col = "red",       cex = 0.9)
mtext(paste0("n required = ", n_required),
      side = 3, line = 0.3, cex = 0.95, col = "darkblue", font = 2)

par(mfrow = c(1, 1))  # reset layout