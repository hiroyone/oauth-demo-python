FROM ubuntu:latest
RUN apt-get -qqy update \
    && DEBIAN_FRONTEND=noninteractive apt-get -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" upgrade \
    && apt-get -qqy install postgresql python-psycopg2 \
    && apt-get -qqy install python-sqlalchemy \
    && apt-get -qqy install python-pip
    # && apt-get install -y python3-pip python3-dev build-essential \
    # && cd /usr/local/bin \
    # && ln -s /usr/bin/python3 python \
    # && pip3 install --upgrade pip
COPY . /app
WORKDIR /app 
RUN pip install -r requirements.txt
RUN python database_setup.py
RUN python lotsofmenus.py  
ENTRYPOINT ["python"]
CMD ["project.py"]

# Build command
# docker build -t webserver-oauth:latest .

# Client ID
# 984225761353-42g17qlqk1ddr9fskuroptcpgq6ish26.apps.googleusercontent.com

# Client Secret
# 6c0nHVxgxy1MIeyVpu-G9OJQ






