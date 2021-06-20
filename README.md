# Amazon Vine Analysis using PySpark/SQL

## Overview 

The Amazon Vine program is a service that allows manufacturers and publishers to receive reviews for their products. There are approximately 50 datasets which contains review data for variety of products. For this project, we are going to analyze the Beauty product reviews in the US by completing the following tasks:

-	Perform ETL on Amazon Beauty product reviews
-	Determine Bias of Vine Reviews 

## Analysis

1.	In order to Perform ETL on Amazon Beauty product reviews, created an AWS RDS database with tables in pgAdmin. Used PySpark extracted the beauty product reviews dataset into     a DataFrame. 

    ![inst1](https://user-images.githubusercontent.com/79289806/122660522-44652400-d150-11eb-98aa-c867d03c3f5b.png)

    Used PySpark tansformed the DataFrame to separate DataFrames that matches to tables under pgAdmin schema. 

    Tables in pgAdmin:

    ![inst2](https://user-images.githubusercontent.com/79289806/122660523-44fdba80-d150-11eb-98ac-4cefe5664084.png)

    PySpark transformed DataFrames:

    ![inst3](https://user-images.githubusercontent.com/79289806/122660524-44fdba80-d150-11eb-9496-455f81ccae37.png)

    ![inst4](https://user-images.githubusercontent.com/79289806/122660525-44fdba80-d150-11eb-9eb4-f9a0d574eb43.png)

    ![inst5](https://user-images.githubusercontent.com/79289806/122660526-44fdba80-d150-11eb-9695-bce785f8696e.png)

    ![inst6](https://user-images.githubusercontent.com/79289806/122660527-44fdba80-d150-11eb-85ce-a696030ea08c.png)

    Uploaded the transformed DataFrames to each table in pgAdmin.
 
    ![inst7](https://user-images.githubusercontent.com/79289806/122660528-44fdba80-d150-11eb-8004-6c5d37ec3c94.png)
  
2.	Used the vine_table uploaded to pgAdmin from pySpark, conducted analysis to determine if having a paid Vine review makes a difference in the percentage of 5-star reviews. In     this analysis, used SQL as the programming language. 

    1)	Filtered the vine table to only have reviews with total votes larger or equals to 20.

       ![inst8](https://user-images.githubusercontent.com/79289806/122660529-44fdba80-d150-11eb-92da-312124e61ce7.png) 

    2)	Further filtered the data with the rate of helpful votes over total votes larger or equals to 50%.

       ![inst9](https://user-images.githubusercontent.com/79289806/122660509-4333f700-d150-11eb-867e-dc497279ea29.png)

    3)	Split the vine table into Vine program reviews, and non-Vine program reviews based on the value of “vine” (Y/N) in the vine table. 

       ![inst10](https://user-images.githubusercontent.com/79289806/122660510-43cc8d80-d150-11eb-8a28-8d0c831a2135.png)
       ![inst11](https://user-images.githubusercontent.com/79289806/122660511-43cc8d80-d150-11eb-94f9-b9b91fb33e44.png)

    4)	For Vine program reviews and non-Vine program reviews respectively, calculated the total number of reviews, number of 5-star reviews and the percent of 5-star reviews.

    Vine program reviews:

      ![inst12](https://user-images.githubusercontent.com/79289806/122660512-43cc8d80-d150-11eb-8666-48eacc87e207.png)

    Non-Vine program reviews:

      ![inst13](https://user-images.githubusercontent.com/79289806/122660513-43cc8d80-d150-11eb-9a60-44d7da5ba019.png)

## Results

1.	Regardless of Vine program or non-Vine program reviews, there are 5,115,666 reviews in total:
 
    ![inst14](https://user-images.githubusercontent.com/79289806/122660514-43cc8d80-d150-11eb-9ce0-e7c8f72c6bcc.png)
  
2.	After restricted the vine table to total votes larger or equals to 20, and the rate of helpful votes over total votes larger or equals to 50%, there are 74,760 reviews.

    ![inst15](https://user-images.githubusercontent.com/79289806/122660515-43cc8d80-d150-11eb-8d2a-11286d6413d7.png) 

3.	Among these reviews, there are 647 Vine reviews, and 74,113 non-Vine reviews. 

    Vine reviews:

    ![inst16](https://user-images.githubusercontent.com/79289806/122660516-44652400-d150-11eb-8612-7c15be858dc3.png)

    Non-Vine reviews:

    ![inst17](https://user-images.githubusercontent.com/79289806/122660517-44652400-d150-11eb-8aa4-ec2d9b2d0e75.png) 

4.	Among all the Vine reviews, there are 229 5-star reviews:

    ![inst18](https://user-images.githubusercontent.com/79289806/122660518-44652400-d150-11eb-9f51-cff13aedebb3.png)

    Among all non-Vine reviews, there are 43,217 5-start reviews:

    ![inst19](https://user-images.githubusercontent.com/79289806/122660519-44652400-d150-11eb-92c5-d9dfd848c8e7.png)

5.	There are approximately 35.39% of 5-star reviews among all the Vine review.

    ![inst20](https://user-images.githubusercontent.com/79289806/122660520-44652400-d150-11eb-8ace-403bc4f253cc.png)

    For non-Vine reviews, there are approximately 58.31% of 5-star reviews.

    ![inst21](https://user-images.githubusercontent.com/79289806/122660521-44652400-d150-11eb-81df-8ca901974709.png)      

## Summary

From the analysis, for the Beauty products reviews, there are more non-Vine reviews than the Vine program reviews when limited our vine data to total votes larger or equals to 20, and the rate of helpful votes over total votes larger or equals to 50%. Additionally, among these reviews, there is a higher rate of 5-star reviews of non-Vine review compared to Vine program reviews. We could conclude that there is no strong evidence to show positivity bias for reviews in the Vine program. 

Since this analysis only focused on Beauty product reviews among all the product, which might not represent the whole benefit of the Vine program. Further analysis could involve more products and checking for the rate of 4-star, 5-star reviews, as well as different level of helpful reviews to better understand the user feedback on the product and the Vine program. 
