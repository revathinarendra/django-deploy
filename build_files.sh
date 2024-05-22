#!/bin/bash

set -e  # Exit immediately if a command exits with a non-zero status
set -o pipefail  # Consider the pipeline as failed if any command fails

# Log function to capture errors and steps
log() {
    echo "$(date +"%Y-%m-%d %H:%M:%S") - $1"
}

# Path to the virtual environment
VENV_PATH="/c/Users/Admin/Desktop/django/django-env/Scripts"

# Check if Python is available
if ! command -v /c/Users/Admin/AppData/Local/Programs/Python/Python312/python &> /dev/null
then
    log "Python could not be found"
    exit 1
fi

log "Activating virtual environment"
source $VENV_PATH/activate || { log "Failed to activate virtual environment"; exit 1; }

log "Ensuring pip is available"
python -m ensurepip --upgrade || { log "Failed to ensure pip"; exit 1; }

log "Upgrading pip"
python -m pip install --upgrade pip || { log "Failed to upgrade pip"; exit 1; }

log "Installing dependencies from requirements.txt"
python -m pip install -r requirements.txt || { log "Failed to install dependencies"; exit 1; }

log "Running collectstatic"
python manage.py collectstatic --noinput || { log "Failed to run collectstatic"; exit 1; }

log "Running migrations"
python manage.py migrate || { log "Failed to run migrations"; exit 1; }

log "Deactivating virtual environment"
deactivate || { log "Failed to deactivate virtual environment"; exit 1; }

log "Build process completed successfully"
