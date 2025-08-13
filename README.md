# Data Warehousing and Mining End Semester Exam

## Note To Me

**From OLAP Queries to Association Rule Mining analyse the outputs!!**

## Preamble

### Directory Tree

Use the following directory tree to locate the Jupyter Notebooks, CSV files and Visualisations.

```
data
└── raw
    └── Online Retail.xlsx

data_mining
├── classification_and_association_rules
│   ├── decision_tree_iris.png
│   └── mining_iris_basket.ipynb
├── clustering
│   ├── clustering_iris.ipynb
│   ├── k_means_cluster_iris.png
│   ├── k_means_cluster_scaled.csv
│   ├── k_means_elbow_curve_iris.png
├── preprocessing_and_exploration

data_warehousing
├── design
│   ├── Star Schema Design.png
│   └── tables.sql
├── etl
│   ├── customer_dimension_table_first_five.csv
│   ├── customer_dimension_table.png
│   ├── date_dimension_table_first_five.csv
│   ├── date_dimension_table.png
│   ├── etl_retail.ipynb
│   ├── product_dimension_table_first_five.csv
│   ├── product_dimension_table.png
│   ├── retail_dw.db
│   ├── sales_fact_table.png
│   └── sales_facts_table_first_five.csv
├── olap
│   ├── drill_down_on_particular_country.csv
│   ├── drill_down_on_particular_country.png
│   ├── olap_visualisation.ipynb
│   ├── queries.sql
│   ├── report.md
│   ├── roll_up_on_total_sales_by_country_and_quarter.csv
│   ├── roll_up_on_total_sales_by_country_and_quarter_top_5_countries.png
│   ├── slice_on_a_particular_product.csv
│   └── slice_on_a_particular_product.png

.gitignore
README.md
requirements.txt
save_pip_requirements.sh
```

### Configuring the Python Environment

There is a `requirements.txt` file that specifies all the needed modules to run the Jupyter Notebooks.

The code has been tested to work with:

```
Python 3.13
Fedora Linux 42
```

```
Python 3.12
Ubuntu Linux 24.04
```

The instructions will cater for both Windows and Linux environments.

#### 1. Create a Virtual Environment

In your project directory, run the following command to create a virtual environment named `.venv`:

Windows:

```bash
python -m venv .venv
```

Linux:

```bash
python3 -m venv .venv
```

#### 2. Activate the Virtual Environment

Windows:

```bash
.\.venv\Scripts\activate
```

Linux:

```bash
source .venv/bin/activate
```

#### 3. Install dependencies

```bash
pip install -r requirements.txt
```

## Data Warehousing

### Data Warehouse Design

#### Schema Design

The star schema is modelled after the UCI ML dataset on Online Retail transactions.

![](./data_warehousing/design/star_schema_design.png)

#### Efficacy of Star Schema over Snowflake

A star schema is preffered in a data warehouse since it is simple and denormalized. This means that to analyse data few joins are needed translating to fast query speeds. This means that since data warehousing focuses on OLAP queries and reporting a star schema is the most suitable schema.

### ETL Process Implementation


#### Customer Dimension Table

![](./data_warehousing/etl/customer_dimension_table.png)


#### Product Dimension Table

![](./data_warehousing/etl/product_dimension_table.png)


#### Date Dimension Table

![](./data_warehousing/etl/date_dimension_table.png)


#### Sales Fact Table

![](./data_warehousing/etl/sales_fact_table.png)


These images have their corresponding `.csv` files for viewing in a spreadsheet.

### OLAP Queries and Analysis

To run this notebook one must have chrome already preinstalled. Chrome enables `plotly` to save visualisations. Failure to have this dependency will lead to errors.

The report for the OLAP queries and analysis is [OLAP Report](./data_warehousing/olap/report.md)
**Write This Report!!**

## Data Mining

### Data Preprocessing and Exploration

The Iris dataset is used.

A `MinMax` scaler and `LabelEncoder` are used to prepare this dataset for machine learning algorithms.

#### Exploration

##### Pairplot

![](./data_mining/preprocessing_and_exploration/pairplot_iris.png)

##### Correlation Heat Map

![](./data_mining/preprocessing_and_exploration/correlation_heatmap_iris.png)

##### Boxplot

![](./data_mining/preprocessing_and_exploration/boxplot_iris.png)

### Clustering

#### K-Means Cluster

![](./data_mining/clustering/k_means_cluster_iris.png)

#### K-Means Elbow Curve

![](./data_mining/clustering/k_means_elbow_curve_iris.png)

### Classification and Association Rule Mining

#### Classification

The decision tree is:

![](./data_mining/classification_and_association_rules/decision_tree_iris.png)

It is found that both KNN with k=5 and the decision tree perform with the same efficacy having perfect scores for every value in the testing set.

#### Association Rule Mining

Synthetic data was generated with a seed of `42`.

The frequent itemsets are obtained and the association rules mapped out. The analysis of these rules is provided in the notebook.

