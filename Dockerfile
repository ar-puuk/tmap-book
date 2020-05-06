FROM geocompr/geocompr:rstudio_preview
RUN R -e "remotes::install_cran('tinytest')"
# install the r-spatial stack linking to new OSGeo pkgs
RUN su rstudio && \
  cd /home/rstudio && \
  wget https://github.com/mtennekes/tmap_book/archive/master.zip && \
  unzip master.zip && \
  mv tmap_book-master /home/rstudio/tmap_book && \
  cd tmap_book && \
  make html
RUN chown -Rv rstudio /home/rstudio/tmap_book 