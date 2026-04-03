
# =============================================================================
# create_dataset
# =============================================================================
# Author      : Ema Cerezo
# Date        : 2026-04-03
# Description : This script creates the datasets used in the analysis.
# Dependencies: jsonlite
#
# Source(s):
# - Glottolog 5.3     -> Families, subfamilies
# - 100 MSLAW dataset -> Languages, number of users 
# =============================================================================
#
# About the 100 MSLAW dataset:
# 
# Full name:  "100 Most Spoken Languages Around the World"
# Author:     narmelan
# Platform:   Kaggle
# URL:        https://www.kaggle.com/datasets/narmelan/100-most-spoken-languages-around-the-world
# Accessed:   2026-04-03
#
# Upstream sources cited by the dataset author:
#   - Ethnologue (ethnologue.com) — speaker counts and language vitality
#   - Glottolog (glottolog.org)   — genealogical classification
#   - Wikipedia                   — supplementary language metadata



# ----------------------------------------------------------------- Libraries

packages <- c("jsonlite")

for (pkg in packages) {
  if (!requireNamespace(pkg, quietly = TRUE)) install.packages(pkg)
  library(pkg, character.only = TRUE)
}


# ----------------------------------------------------- Language top families

names = c("Atlantic-Congo",
          "Austronesian",
          "Indo-European",
          "Sino-Tibetan",
          "Afro-Asiatic",
          "Bookkeeping",
          "Nuclear Trans New Guinea",
          "Pama-Nyungan",
          "Sign Language",
          "Otomanguean",
          "Austroasiatic",
          "Unclassifiable",
          "Tai-Kadai",
          "Pidgin",
          "Dravidian",
          "Arawakan",
          "Mande",
          "Tupian",
          "Uto-Aztecan",
          "Unattested",
          "Central Sudanic",
          "Nilotic",
          "Nuclear Torricelli",
          "Uralic",
          "Algic",
          "Athabaskan-Eyak-Tlingit",
          "Pano-Tacanan",
          "Hmong-Mien",
          "Quechuan",
          "Turkic",
          "Cariban",
          "Kru",
          "Nakh-Daghestanian",
          "Sepik",
          "Mayan",
          "Artificial Language",
          "Nuclear-Macro-Je",
          "Chibchan",
          "Tucanoan",
          "Salishan",
          "Ramu",
          "Timor-Alor-Pantar",
          "Dogon",
          "Lakes Plain")

short = c("AtCo",
          "AuNe",
          "InEu",
          "SiTi",
          "AfAs",
          "Book",
          "NTNG",
          "PaNy",
          "SiLa",
          "Otom",
          "AuAs",
          "Uncl",
          "TaKa",
          "Pidg",
          "Drav",
          "Araw",
          "Mand",
          "Tupi",
          "UtAz",
          "Unat",
          "CeSu",
          "Nilo",
          "NuTo",
          "Ural",
          "Algi",
          "AETl",
          "PaTa",
          "HmMi",
          "Quec",
          "Turk",
          "Cari",
          "Kruu",
          "NaDa",
          "Sepi",
          "Maya",
          "ArLa",
          "NMJe",
          "Chib",
          "Tuca",
          "Sali",
          "Ramu",
          "TAPa",
          "Dogo",
          "LaPl")

child_lan_num = c(14,
                  12,
                  58,
                  51,
                  38,
                  38,
                  31,
                  25,
                  22,
                  18,
                  15,
                  12,
                  95,
                  87,
                  82,
                  77,
                  75,
                  70,
                  69,
                  68,
                  63,
                  56,
                  55,
                  49,
                  47,
                  46,
                  45,
                  44,
                  43,
                  43,
                  42,
                  38,
                  36,
                  36,
                  34,
                  31,
                  29,
                  27,
                  26,
                  25,
                  24,
                  23,
                  20,
                  20)

subfamilies_num = c(93,
                    76,
                    35,
                    32,
                    25,
                    1,
                    19,
                    15,
                    45,
                    10,
                    95,
                    0,
                    65,
                    49,
                    47,
                    55,
                    59,
                    47,
                    40,
                    18,
                    39,
                    37,
                    30,
                    31,
                    26,
                    27,
                    21,
                    25,
                    24,
                    30,
                    24,
                    29,
                    22,
                    23,
                    25,
                    2,
                    17,
                    18,
                    22,
                    15,
                    14,
                    14,
                    9,
                    10)

top_families = setNames(lapply(seq_along(short),
                               function(i) list(
                                 name = names[i],
                                 sub_families_num = subfamilies_num[i],
                                 child_lan_num = child_lan_num[i])),
                        short)

write_json(top_families, 
           file.path(getwd(), "data", "topfam.json"), 
           pretty = TRUE, 
           auto_unbox = TRUE)


# --------------------------------------------------------- Languages and users



# ------------------------------------------------------ Languages sub-families