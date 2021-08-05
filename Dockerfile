FROM rapporteket/dev:0.1

LABEL maintainer "Are Edvardsen <are.edvardsen@helse-nord.no>"

# hadolint ignore=DL3008

# add registry dev config and R pkg dependencies
COPY --chown=rstudio:rstudio db.yml /home/rstudio/rap_config/
RUN cat /home/rstudio/rap_config/db.yml >> /home/rstudio/rap_config/dbConfig.yml \
    && rm /home/rstudio/rap_config/db.yml \
    && R -e "install.packages(c('DT',\
                                'dplyr',\
                                'ggplot2',\
                                'kableExtra',\
                                'lubridate',\
                                'magrittr',\
                                'readr',\
                                'rlang',\
                                'shiny',\
                                'shinyalert',\
                                'shinyWidgets',\
                                'tibble'))" \
    && R -e "remotes::install_github(c('Rapporteket/rapbase'))"

