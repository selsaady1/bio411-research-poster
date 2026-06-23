# Conservation & Ecology Research Poster

> Long-term analysis of bird diversity across urban and non-urban habitats in R

![R](https://img.shields.io/badge/R-0a7?style=flat-square) ![R Markdown](https://img.shields.io/badge/R_Markdown-0a7?style=flat-square) ![ggplot2](https://img.shields.io/badge/ggplot2-0a7?style=flat-square) ![dplyr](https://img.shields.io/badge/dplyr-0a7?style=flat-square) ![tidyr](https://img.shields.io/badge/tidyr-0a7?style=flat-square) ![readr](https://img.shields.io/badge/readr-0a7?style=flat-square) ![tidyverse](https://img.shields.io/badge/tidyverse-0a7?style=flat-square) ![car](https://img.shields.io/badge/car-0a7?style=flat-square) ![vegan](https://img.shields.io/badge/vegan-0a7?style=flat-square) ![lme4](https://img.shields.io/badge/lme4-0a7?style=flat-square) 

![Conservation &amp; Ecology Research Poster](images/fig1.png)

### 🌐 Live project page → **https://selsaady1.github.io/bio411-research-poster/**

## Overview
A quantitative ecology research project for BIO 411 analyzing how bird species diversity differs across urban, desert, riparian, and agricultural habitats over time, using long-term CAP LTER bird monitoring data. The work controls for differences between two survey strategies (ESCA broad regional sampling and PASS neighborhood-focused surveys) so that habitat comparisons reflect ecology rather than sampling effort. The central deliverable is a scientific research poster, supported by a series of R-based statistical check-in assignments covering distributions, regression, ANOVA, GLMs, and community ordination.

**Highlight:** Species-richness decline over time: R2 = 0.12, p = 0.07

**Highlight:** Species-richness decline over time: R2 = 0.12, p = 0.07

## Key Achievements
- Built a reproducible data-cleaning pipeline that merged the ESCA and PASS survey datasets on survey_id and site_code, removed incomplete records, and standardized species abundance and richness to control for unequal sampling effort
- Tested long-term species-richness trends with linear regression, reporting a weak, non-significant decline over time (R2 = 0.12, p = 0.07)
- Compared species richness across habitats using ANOVA, with Shapiro-Wilk and Levene's tests confirming normality and variance assumptions plus residual and QQ plot checks
- Produced habitat- and time-based figures in ggplot2 (species richness, abundance by habitat, abundance by rainfall, diversity over time, average temperature)
- Demonstrated a broader quantitative ecology toolkit across supporting assignments: binomial/logistic GLMs, two-way ANOVA, and NMDS community ordination with the vegan package

## Approach
Bird monitoring records from the CAP LTER were cleaned and merged in R, with abundance and richness standardized to account for the different sampling intensities of the ESCA and PASS survey strategies. Habitat differences were assessed with ANOVA after verifying normality and homogeneity-of-variance assumptions, and long-term change was tested with linear regression backed by residual and QQ diagnostics. Results were visualized with ggplot2 and synthesized into a research poster, with multiple regression, mixed-effects models, and machine learning (Random Forest, Gradient Boosting) outlined as future work.

## Tools & Technologies
- R
- R Markdown
- ggplot2
- dplyr
- tidyr
- readr
- tidyverse
- car
- vegan
- lme4
- fitdistrplus
- stats (ANOVA, GLM, linear regression)

## Gallery
![figure](images/fig2.png)
![figure](images/fig3.png)
![figure](images/fig4.png)
![figure](images/fig5.png)

## Repository Structure
```
.gitignore
.nojekyll
LICENSE
README.md
docs/BIO411Poster.pptx_4_-1.pdf
docs/BIO411Poster.pptx_4_.pdf
docs/Elsaady_Project-1-1-1.html
docs/FinalProject_BIO410-1_1_.html
docs/Module-3-Section-4-Questions.html
docs/Module-4-Overview-Student-Script.html
docs/Module2_Section1_Elsaady_Output-1.txt
docs/Module2_Section_2_Elsaady_Output.txt
docs/Module5FINAL-1.html
docs/SaifEModule-3-Overview-Assessment--1-.html
images/Abundancedbyhabitat.png
images/DiversityOT.png
images/TOP3COLORSEXCEL.png
images/abundancebyrainfall.png
images/average_temp.png
images/fig1.png
images/fig2.png
images/fig3.png
images/fig4.png
images/fig5.png
images/speciesrichness.png
index.html
src/Elsaady_Project_1-1-1.Rmd
src/FinalProject_BIO410-1_1_.Rmd
src/Module2_Section1_Elsaady-1.R
src/Module2_Section_2_Elsaady.R
src/Module5FINAL-1.Rmd
src/Module_2_Section_3_Script.R
src/Module_3_Section_4_Questions.Rmd
src/Module_4_Overview_Student_Script.Rmd
src/SaifEModule_3_Overview_Assessment_1_.Rmd
```

## Results
The poster reports a weak, non-significant decline in species richness over time (R2 = 0.12, p = 0.07); urban (PASS) sites showed lower richness but high bird abundance, while riparian habitats held the highest richness, pointing to water and vegetation cover as key drivers. See docs/BIO411Poster.pptx_4_.pdf for the full deliverable.

## Deliverable
See [`docs/BIO411Poster.pptx_4_.pdf`](docs/BIO411Poster.pptx_4_.pdf).

## License
MIT — see [`LICENSE`](LICENSE).

---
_Part of [Saif Elsaady's engineering portfolio](https://selsaady1.github.io/portfolio/). Deliverables only — routine homework/quizzes/exams excluded._