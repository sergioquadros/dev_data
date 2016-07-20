---
title: "Iris"
author: "Sergio H. S. de Quadros"
date: '2016-06-26'
output:
  html_document:
    fig_caption: yes
    keep_md: yes
  pdf_document: default
---



### Iris: Some approaches for this _Shiny app_ and _Slidify_ presentation

The Edgar Anderson's Iris Data with 50 observations for each of these three species - _I. setosa_, _I. versicolor_ and  _I. virginica_ became a classical multiclass problem with Fisher's works.

This work presents a developing data product and it isn't neither an exhaustive shiny use nor an completed exploratory analysis. This task was done for the course _Developing Data Products - Johns Hopkins University/Coursera_ and displays a **shiny app** and a **slidify presentation**.  

We look for different distributions for each species at numeric variables using the exploratory plots.  

We added a reactive counter if the user wants to count how many plots were viewed.

We must select at first if you want a boxplot, a histogram or a scatter plot:
 
1.   At boxplot you can select which numeric variable you want for summarising;

2.   For the histogram you can choose a numeric variable, then you select if the plot shall be coulored by "Species" or not, and the number of bins at last. This way display the plot with Shapiro' test for normality;   

3.   For the scatter plot is coulored by "Species" and you can choose 2 numeric variables and shall display it.

<!-- html table generated in R 3.3.1 by xtable 1.8-2 package -->
<!-- Tue Jul 19 16:49:48 2016 -->
<table border=1>
<tr> <th>  </th> <th>  Sepal.Length </th> <th>  Sepal.Width </th> <th>  Petal.Length </th> <th>  Petal.Width </th>  </tr>
  <tr> <td align="right"> 1 </td> <td> Min.   :4.300   </td> <td> Min.   :2.000   </td> <td> Min.   :1.000   </td> <td> Min.   :0.100   </td> </tr>
  <tr> <td align="right"> 2 </td> <td> 1st Qu.:5.100   </td> <td> 1st Qu.:2.800   </td> <td> 1st Qu.:1.600   </td> <td> 1st Qu.:0.300   </td> </tr>
  <tr> <td align="right"> 3 </td> <td> Median :5.800   </td> <td> Median :3.000   </td> <td> Median :4.350   </td> <td> Median :1.300   </td> </tr>
  <tr> <td align="right"> 4 </td> <td> Mean   :5.843   </td> <td> Mean   :3.057   </td> <td> Mean   :3.758   </td> <td> Mean   :1.199   </td> </tr>
  <tr> <td align="right"> 5 </td> <td> 3rd Qu.:6.400   </td> <td> 3rd Qu.:3.300   </td> <td> 3rd Qu.:5.100   </td> <td> 3rd Qu.:1.800   </td> </tr>
  <tr> <td align="right"> 6 </td> <td> Max.   :7.900   </td> <td> Max.   :4.400   </td> <td> Max.   :6.900   </td> <td> Max.   :2.500   </td> </tr>
   </table>
