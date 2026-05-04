library(sf)
library(mapgl)
load("/Users/fdzul/Documents/geocoding_mx_2026_dengue/4.RData/dengue_mx_2026.RData")
source("~/Library/CloudStorage/Dropbox/r_developments/r_dashboards/netlify/1.2.persisten_dengue_transmission_2026/persistent_dengue_transmission_10_durango/mp_heatmap.R")
source("~/Library/CloudStorage/Dropbox/r_developments/r_dashboards/netlify/1.2.persisten_dengue_transmission_2026/persistent_dengue_transmission_10_durango/mp_transmission_chains.R")
library(fishualize)

source("~/Library/CloudStorage/Dropbox/r_developments/r_dashboards/netlify/1.2.persisten_dengue_transmission_2026/persistent_dengue_transmission_10_durango/mp_dengue_cases.R")

z |>
    dplyr::mutate(onset = FEC_INI_SIGNOS_SINT) |>
    dplyr::mutate(month = lubridate::month(onset)) |>
    dplyr::filter(month %in% c(4)) |>
    dplyr::select(ANO, long, lat, onset) |>
    dplyr::mutate(x = long,
                  y = lat) |>
    sf::st_as_sf(coords = c("x", "y"),
                 crs = 4326) |>
    mp_dengue_cases(yrs = 2026,
                    locality = "Cuautla",
                    cve_edo = "17")


z |>
    dplyr::mutate(onset = FEC_INI_SIGNOS_SINT) |>
    dplyr::mutate(month = lubridate::month(onset)) |>
    dplyr::filter(month %in% c(4)) |>
    dplyr::select(ANO, long, lat, onset) |>
    dplyr::mutate(x = long,
                  y = lat) |>
    sf::st_as_sf(coords = c("x", "y"),
                 crs = 4326) |>
    mp_dengue_cases(yrs = 2026,
                    locality = c("Cuernavaca", 
                                 "Emiliano Zapata",
                                 "Jiutepec",
                                 "Xochitepec",
                                 "Temixco"),
                    cve_edo = "17")


