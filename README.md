# Analysis of Purchase Orders and Visualization System: Integration and Data Optimization for PERÚ COMPRAS
Data Analyst projects

👀 Data Description: The dashboard is implemented on a purchase order system originating from the Electronic Catalogs of the Central Public Procurement - PERÚ COMPRAS. The records represent an official purchase order that complies with the selection and operation rules established by the Framework Agreements Directorate of Perú Compras. More information

✍ SQL Server: To organize and clean these data, a program called SQL Server was used. In this program, temporary tables were created to store the initial data, and dimensional tables were defined to organize the information more efficiently. Subsequently, data from the temporary tables were loaded into the dimensional tables, and a fact table was created that connects with the dimensional tables via foreign keys.

📊 SQL Server Integration Services (SSIS): Next, this process was adapted to utilize a program called SSIS. With SSIS, data cleaning was improved, and a more efficient process was created for loading data into the dimensional tables. Additionally, a star schema diagram was generated to show the relationship between the fact table and dimensional tables.

📈 Planned Improvements: In the future, further improvements to data processing are planned. This involves enhancing data cleaning and selecting the most relevant columns from the temporary table for analysis.

👀 Sales and Orders Dashboard Summary

✍ The goal of the dashboard is to provide an innovative way to visualize and analyze sales and order data. It is presented attractively, facilitating tracking of key figures.

💰 Total Sales: The dashboard displays total sales figures for each month, subtotal, VAT, and total amount. Monthly delta values are also included to identify trends or significant changes over time.

📈 Formalization Time: The average formalization time of purchase orders is shown in a monthly bar chart. Differences between months indicate potential changes in the process, helping to eliminate inconsistencies and improve efficiency.

📉 Overdue Orders: A counter displays the number of overdue orders. This helps monitor and reduce response times, ensuring orders are processed on time.

🏢 Entities and Suppliers: Ring charts categorize the entities and suppliers involved in purchase orders. This provides a clear distribution and facilitates analysis of engagement with different entities and suppliers.

🌍 Geographic Sales Location: The dashboard includes interactive maps showing the geographic distribution of sales. This allows better understanding of the market and identification of expansion opportunities in different regions.

Suggestions for Dashboard Improvement:

Alerts and Notifications: Developing automatic alerts highlighting significant deviations or goal achievements would be beneficial. This would help users quickly identify areas for improvement or success in the purchase order process.
Data Export: Including PDF export options would be useful for users to analyze and share information more conveniently. This would enable better collaboration and communication among different teams involved in public procurement processes.
In summary, this report aims to enhance decision-making strategies and process efficiency at the central public procurement orders of Perú. The sales and orders dashboard provides a clear and comprehensive visualization of data, facilitating tracking and analysis of key figures. Furthermore, additional improvements are suggested, such as automatic alerts and data export options, to further optimize the process.






3.5
