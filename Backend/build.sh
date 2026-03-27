set -o errexit

pip install -r requirements.txt

python manage.py collectstatic --noinput

python manage.py migrate
python manage.py migrate --fake-initial
gunicorn Hospital_Project.asgi:application --bind