
# build_files.sh

#!/bin/bash
# Ensure pip is available
/usr/bin/python -m ensurepip --upgrade
# Upgrade pip
/usr/bin/python -m pip install --upgrade pip
# Install dependencies from requirements.txt
/usr/bin/python -m pip install -r requirements.txt
# Add other necessary build steps below
python manage.py collectstatic --noinput
#!/bin/bash



