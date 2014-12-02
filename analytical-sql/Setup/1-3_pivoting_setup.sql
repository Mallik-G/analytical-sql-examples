rem  new pivoting source views to make demonstration of pivoting features
rem  a lot easier
rem

CREATE OR REPLACE VIEW PIVOT_CHAN_PRODCAT_SALES AS
SELECT * FROM
(SELECT
 calendar_quarter_desc AS qtr,
 prod_category_desc AS category,
 channel_class AS channel,
 sum(amount_sold) AS sales
FROM chan_prodcat_monthly_sales
WHERE calendar_year_id = '1803'
GROUP BY calendar_quarter_desc, 
         prod_category_desc, channel_class)
PIVOT(sum(sales) 
      FOR channel 
      IN ('Direct', 'Indirect', 'Others'))
ORDER BY qtr, category;