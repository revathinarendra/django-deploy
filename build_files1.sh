
# build_files.sh

#!/bin/bash
# Ensure pip is available
#/usr/bin/python3.12.2 -m ensurepip --upgrade
# Upgrade pip
#/usr/bin/python3.12.2 -m pip install --upgrade pip
# Install dependencies from requirements.txt
#/usr/bin/python3.12.2 -m pip install -r requirements.txt
# Add other necessary build steps below
#python3.12.2 manage.py collectstatic --noinput
#!/bin/bash



# Ensure pip is available
python -m ensurepip --upgrade

# Upgrade pip
python -m pip install --upgrade pip

# Install dependencies from requirements.txt
python -m pip install -r requirements.txt

# Run Django management commands
python manage.py collectstatic --noinput
python manage.py migrate

# Deactivate the virtual environment (optional)
deactivate
