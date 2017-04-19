#' read_particle parses the hymodelc PARTICLE.DAT output file
#' @author Ben Fasoli
#'
#' @param file location of PARTICLE.DAT file
#' @param varsiwant character vector of 4-letter hymodelc variables
#'
#' @import dplyr, uataq
#' @export

read_particle <- function(file, varsiwant) {
  require(dplyr)

  header <- scan(file, n = 3, quiet = T)
  n_lines <- uataq::count_lines(file)

  if (n_lines < 2) {
    warning(paste('read_particle(): only 1 line found in', file))
    return(NULL)
  }

  read.table(file, header = F, skip = 1,
             colClasses = 'numeric', col.names = varsiwant) %>%
  mutate(r_lati = header[1],
         r_long = header[2],
         r_zagl = header[3]) %>%
    as_data_frame() %>%
    return()
}
