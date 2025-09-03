# `formsiteR`: An R client for the Formsite API
 
Provides functions to interact with Formsite forms via the [Formsite API](https://support.formsite.com/hc/en-us/articles/360000288594-API), including listing forms, retrieving form items, downloading results, and managing webhooks.

**Still needs a lot of work!!**
---

## Installation

You can install the development version of `formsiteR` directly from GitHub using **`devtools`** or **`remotes`**:

```r
# Install devtools if you don't have it
install.packages("devtools")

# Install formsiteR from GitHub
devtools::install_github("kerchner/formsiteR")
```

## Usage

### Set environment variables in `.Renviron` file

Create a text file called `.Renviron`.  It should look something like this (substitute the values that you have from Formsite).  Do not enclose the values in quotes.

```
FORMSITE_API_TOKEN=your-api-token
FORMSITE_API_SERVER=fs8  # for example, fs8
FORMSITE_API_USERDIR=your-user-directory
FORMSITE_API_FORMDIR=your-form-directory
```

### Sample code

```
library(formsiteR)
library(purrr) # needed for flatten()

# Load configurations from .Renviron
fs_set_config()

# Get the list of forms
forms_list <- list_forms()

# Get the results from the form specified in the .Renviron file
results_list <- get_form_results()

# Dispay the results in a flattened format
flatten(results_list$results)
```
