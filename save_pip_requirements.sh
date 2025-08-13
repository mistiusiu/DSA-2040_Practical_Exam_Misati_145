#!/bin/bash

# Save installed packages without versions to requirements.txt
pip freeze | sed 's/==.*//' > requirements.txt

