
# =============================================================================
# create_dataset
# =============================================================================
# Author      : Ema Cerezo
# Date        : 2026-04-03
# Description : This script creates the datasets used in the analysis.
# Dependencies: jsonlite
# =============================================================================


# ----------------------------------------------------------------- Libraries

packages <- c("jsonlite")

for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
  library(pkg, character.only = TRUE)
}


# ----------------------------------------------------- Language top families

top_families_raw = read.csv(
  file.path(getwd(), "data-raw", "top_families.csv"),
  stringsAsFactors = FALSE
)

top_families = setNames(
  lapply(seq_len(nrow(top_families_raw)), function(i) list(
    name = top_families_raw$name[i],
    sub_families_num = top_families_raw$sub_families_num[i],
    child_lan_num = top_families_raw$child_lan_num[i])),
  top_families_raw$short
)

write_json(
  top_families,
  file.path(getwd(), "data", "topfam.json"),
  pretty      = TRUE,
  auto_unbox  = TRUE
)


# --------------------------------------------------------- Languages and users



# ------------------------------------------------------ Languages sub-families
