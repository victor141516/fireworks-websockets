FROM python:3-alpine

WORKDIR /app
COPY . /app
RUN apk add --no-cache gcc musl-dev
RUN pip install -r requirements.txt
RUN pip install gunicorn
RUN apk del gcc musl-dev
CMD [ "gunicorn", "-w4", "-b", ":8080", "main:app" ]
