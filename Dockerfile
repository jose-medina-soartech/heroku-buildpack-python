FROM heroku/heroku:16-build

WORKDIR /app
ENV WORKSPACE_DIR="/app/builds" \
    S3_BUCKET="lang-python" \
    S3_PREFIX="heroku-16/"

RUN apt-get update && apt-get install -y python-pip && rm -rf /var/lib/apt/lists/*\
RUN apt-get install sudo
RUN mount -o remount,rw /
RUN apt-get update && apt-get install -y libsm6 libxext6 libxrender1 libsm-dev 

COPY requirements.txt /app/
RUN pip install --disable-pip-version-check --no-cache-dir -r /app/requirements.txt

COPY . /app
