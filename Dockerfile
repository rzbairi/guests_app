FROM python:3.8-buster

COPY requirements.txt /requirements.txt

RUN pip install -r requirements.txt

COPY app/templates /app/templates
COPY app/models.py /app/models.py
COPY app/app.py app/app.py

WORKDIR /app

ENV FLASK_APP=app.py
ENV DATABASE_URL=sqlite:///db.sqlite

CMD flask db init && flask db migrate && flask db upgrade && flask run -h 0.0.0.0 --port $PORT
