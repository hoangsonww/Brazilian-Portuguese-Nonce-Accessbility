library(ggplot2)
library(ggmosaic)

# 1. Hypotheses
# We want to know if word structure (syllable count and initial segment type) 
# influences the acceptability judgments of native Brazilian Portuguese speakers.
# Null hypothesis: Word structure does not influence acceptability judgments.
# Alternative hypothesis: Word structure does influence acceptability judgments.

# 2. Data
bp <- read.csv("bp-nonce.csv")
head(bp)

# 3.Summarize the number of accepted vs. rejected responses based on 
# syllable_count and initial_segment
summary_table <- xtabs(~ response + length + initial, data = bp)
print(summary_table)

# 4. Visualize the data with Mosaic plot
# Outputs a 2x2 grid of mosaic plots, with each plot representing a combination of 
# length and initial segment
ggplot(bp) +
  geom_mosaic(aes(weight = 1, x = product(response), fill = response)) +
  facet_grid(length ~ initial) +
  labs(title = "Mosaic Plot of Responses by Length and Initial",
       x = "Response",
       y = "Proportion") +
  theme_minimal()

# We think that the collapsible variable is initial because initial does not 
# contribute meaningful variability to the response.
# We expect our findings to confirm our alternative hypothesis, which is
# that word structure (initial) does influence acceptability judgments.

# 5. Pick initial and run a significance test with response
# We will use the chi-squared test to determine if there is a significant
# relationship between the initial segment and the response.
chisq.test(xtabs(~ response + initial, data = bp))
# p_value is 0.59

# 6. If we pick our significance level to be 0.05, we fail to reject the null hypothesis.
# Interpretation of result: The data suggests that there is no significant
# evidence of the relationship between the initial segment and the response (i.e. word
# structure likely does not influence acceptability judgments).

# 7. If we run chi-square test to determine if there is association between length and initial, 
# we should get p = 1.
# This is because there is no association or relationship between length and initial. 
# They are perfectly independent.
