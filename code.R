library(blogdown)
blogdown::serve_site()
blogdown::build_site()


#this will help you sucessfully convert rmd to md files
---
  title: "test"
output:
  md_document:
  variant: gfm
preserve_yaml: true
date: "2024-10-18"
---
  