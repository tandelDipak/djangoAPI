FROM python:3.8-alpine

# Do not allow python to buffer the output
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN pip install -r requirements.txt

RUN echo $(pwd)
RUN mkdir /app
WORKDIR /app

# Copy local project folder to docker container
RUN echo $(ls -l)
COPY ./app /app

# Create user for running application
RUN adduser -D user

# We do not want to run as root user so switch to the newly created user
USER user


