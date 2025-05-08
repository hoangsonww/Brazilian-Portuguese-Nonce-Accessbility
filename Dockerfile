# Base R image
FROM r-base:4.3.2

# Install system dependencies for RMarkdown & LaTeX
RUN apt-get update && apt-get install -y \
    libcurl4-openssl-dev libssl-dev libxml2-dev \
    texlive-latex-base texlive-fonts-recommended texlive-latex-extra

# Install R packages
RUN R -e "install.packages(c('ggplot2','ggmosaic','rmarkdown'), repos='https://cloud.r-project.org/')"

WORKDIR /app
COPY . .

# Default: run analysis and render report
CMD ["bash", "-lc", "bash scripts/run_bp_analysis.sh && Rscript -e \"rmarkdown::render('bp_nonce_report.tex', output_format='html_document', output_file='bp_nonce_report.html')\""]
