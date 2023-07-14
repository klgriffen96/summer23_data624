## Introduction     

We have been asked by a beverage manufacturing company to predict pH values of their beverages based on provided product data. pH measures acidity and alkalinity of substances on a scale of 0 to 14, and represents a key performance indicator that affects the flavor profile and quality of beverages as well as their safety for human consumption. (1) Beverages with pH values between 2 and 8.5 are generally safe for human consumption. (2) Values below 7 are acidic, values near 7 are neutral, and values above 7 are alkaline. Every one value of pH represents a ten-fold increase or decrease in acidity or alkalinity. For example, a pH of 4 is 10 times more acidic than a pH a 5, and 100 times (10 x 10) more acidic than a pH of 6. (3) Certain regions or countries may impose regulations requiring beverages maintain a pH value between certain levels. Achieving desired pH levels may also impact cost and timeline of production. For these reasons, accurate predictions of pH are critical to success for a beverage manufacturing company. 

## Executive Summary   

A variety of approaches were used employing various combinations of data to achieve a prediction model with a mean absolute percentage error of 0.8% (less than 1%). For reference, a 0.8% error for a pH level of 7 will result in a pH prediction no greater than 7.056 and no worse than 6.944. We believe that this is an acceptable error range for this business use, as such a variation in pH is inconsequential. Further, our findings identified that the accuracy of the model improved when provided only data that contained brand codes, therefore it is our recommendation to data engineers for best future results that brand code be a required data input. 

Sources:
1. https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4808596/
2. https://www.uclahealth.org/news/ask-the-doctors-is-water-with-a-high-ph-safe-to-drink
3. https://newalbanysmiles.com/ph-values-of-common-beverages/
