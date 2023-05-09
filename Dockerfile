# syntax=docker/dockerfile:1

#FROM pytorch/pytorch
FROM tiangolo/uwsgi-nginx-flask:python3.7

WORKDIR /sentiment-service
COPY ./requirements.txt requirements.txt
RUN pip install -r requirements.txt
RUN python -m nltk.downloader perluniprops
RUN python -m nltk.downloader punkt
COPY . .

EXPOSE 6007

ENV FLASK_APP=main.py

CMD ["python", "main.py"]
#CMD ["flask", "run", "-h 0.0.0.0", "-p 6001"]
