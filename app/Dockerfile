# Will create the docker image to run the flask app with gunicorn server

FROM python:3-alpine

RUN mkdir /assingment_app

WORKDIR /assingment_app

COPY requirements.txt /assingment_app

RUN pip install -U pip && \
    pip install --no-cache-dir -r requirements.txt

COPY . /assingment_app

ENV AWS_ACCESS_KEY_ID "$AWS_ACCESS_KEY_ID"
ENV AWS_SECRET_ACCESS_KEY "$AWS_SECRET_ACCESS_KEY"
ENV BUCKET_NAME "$BUCKET_NAME"

RUN echo "MAKE SURE YOU SET ENV VARIABLES TO CONNECT TO AWS" 

EXPOSE 5000

CMD ["gunicorn","list:app","--config=gunicorn.conf.py"]