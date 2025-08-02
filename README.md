# Uber-supply-demand-gap-analysis

A data-driven analysis aimed at identifying the mismatch between rider demand and driver availability in an urban Uber ecosystem. This project uses real-world data to uncover patterns behind failed trip requests, and offers actionable business recommendations.

**Project Overview**

This project addresses the critical supply-demand gap in Uber cab services across city and airport pickup points. Through the exploration of booking logs, driver availability, and trip statuses, the goal is to identify where, when, and why demand goes unmet—whether due to cancellations or unavailability of cars.

**Problem Statement**

Uber frequently experiences service shortfalls during specific time windows and at key locations. These gaps are primarily driven by:

1. Sudden spikes in demand during peak hours

2. Low availability of drivers

3. Trip cancellations

**Tools used** 

1. Excel for pivot and dashboard creation
2. SQL for querying and data exploration
3. EDA analysis and data visualization using python

**Poor distribution of cars between city and airport zones**

Data Insights & Visualizations
Total Bookings Trend

Pickup Dates: Bookings gradually rise from July 12 to July 15.

Drop Dates: A spike is observed on an undefined day due to missing data entries.

**Trip Status by Pickup Point**

1. City: High number of trip cancellations

2. Airport: High number of ‘No Cars Available’ cases

**Trip Status by Hour**

Morning (5–9 AM): Predominantly cancellations
Evening (5–9 PM): Primarily due to car unavailability

**🌗 Trip Status by Time Slot**

1. Evenings have the highest unfulfilled demand.

2. Early mornings show a peak in cancellations.

**Requests vs Active Drivers**

1. Clear mismatch in peak hours: 7–9 AM and 5–9 PM

2. Driver availability does not align with demand surges

🔥 Heatmap of ‘No Cars Available’

Problem is worst in the evening, across all weekdays

Thursday and Tuesday top the list

**Correlation Matrix**

Strong negative correlation between completed trips and:

Cancellations: −0.41

No Cars Available: −0.68

1. Failed Trips by Hour & Pickup Point

2. City (Morning) and Airport (Evening) have the highest trip failure rates

**Key Findings**

1. Morning and evening slots see maximum service gaps

2. City-based bookings fail mainly due to cancellations

3. Airport-based bookings fail due to unavailability

4. Missing or blank data contributes to misleading trends

**Business Recommendations**

🕑 Increase driver supply during peak hours (7–9 AM, 5–9 PM)

✈️ Deploy more cars to airports during evening time slots

❌ Discourage cancellations through driver incentives or penalties

🗺️ Use historical data for driver-passenger real-time mapping

📱 Enhance UX by offering accurate ETAs and alternate options

🧹 Clean data regularly to reduce missing or delayed entries
