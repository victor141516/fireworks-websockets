FROM python:3-alpine

RUN pip install -r requirements.txt
RUN pip install gunicorn
CMD [ "gunicorn", "-w4", "-b", ":8080", "main:app" ]
