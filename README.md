# E-Commerce Analysis Project

## Project Overview

This project analyzes an e-commerce orders dataset to get insights about **product quality, marketing channels effectiveness, coupon performance and general issues**.

The analysis follows an **end-to-end** analytics workflow, including:
- Data analysis using SQL _(BigQuery)_
- Interactive Tableau dashboard for business stakeholders
- Business suggestions and insights based on analysis

The project is designed to reflect **real-world** product analytics work, with a focus on business impact rather than tool usage alone.

## Business Questions

1. Which marketing channels are the most effective in terms of **customer acquisition**, **revenue generation**, **overall preformance**?
2. Which coupon codes have **better performance**?
3. Which products are the **main revenue drivers**?
4. Which products could be considered as **problematic** ones?

## Dataset

- **Source**: Kaggle - E-Commerce Orders & Customer (2023-01-01 to 2025-06-30)
- **Data Type**: e-commerce transactions
- **Main Features**: Date, Product, Quantity, UnitPrice, OrderStatus, CouponCode, ReferralSource, TotalPrice

## Tools And Technologies

- **SQL**: BigQuery
- **Visualisation**: Tableau
- **Version Control**: GitHub

## Limitations

- Marketing spend is not available, so ROI and ROAS cannot be calculated.
- Product margin is not available, so profit cannot be calculated properly.
- Discount amount is not available, so coupon profitability cannot be measured directly.
- Return and cancellation reasons are not included in the dataset.

## Conclusion

The analysis shows that the business should focus not only on increasing revenue, but also on improving overall order quality.Instagram, Google, SAVE10, Printer and Chair are strong revenue drivers, while high return and cancellation rates indicate operational issues that should be investigated.
