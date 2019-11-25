
#install these packages if you haven't already
# devtools::install_github("nacnudus/tidyxl")
# install.packages(c(stringr","purrr","gdata","dplyr"))

library(tidyxl)
library(stringr)
library(purrr)
library(dplyr)
#Source the format function
source("format_func.R")

#Checking what the final document looks like
# txt_file = "4525.WP1"
# 
# #final format looks like
# #head
# read.fwf(txt_file,widths=rep(6,13),sep="\t",n=2)
# 
# #body
# read.fwf(txt_file,skip=2,widths=rep(6,13),sep="\t")



#Get all files in data directory
dir_list<-list.files("./Data",full.names = TRUE)

#Get the first part of the name
dir_name<-stringr::str_remove(list.files("./Data"),".WP1")

#do this for all files in the directory
map2(dir_list,dir_name,~format_fixed_width(.x,.y))



###########################################################################
#For trouble shooting

#check justification if necessary
formats <- xlsx_formats("Output/7790.xlsx")
formats$local$font$bold


x <- xlsx_cells("Output/7790.xlsx")

#check right justification
x[x$local_format_id %in% which(formats$local$alignment$horizontal=="right"),
  c("address", "character")]


