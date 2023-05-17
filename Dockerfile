FROM python as base

RUN apt update
RUN apt upgrade -y
RUN rm -rf /var/lib/apt/lists/*
RUN pip install --upgrade setuptools, cython, numpy, matplotlib

LABEL maintainer="Shaik Imran"

FROM base AS middle

RUN git clone https://github.com/shaikimranpersistent/dummy-webapp-finadict.git
WORKDIR ./dummy-webapp-finadict
RUN ls -a
RUN pip install -r ./requirements.txt
RUN pip install --only-binary pystan==2.19.1.1

FROM middle AS app

ENV STREAMLIT_SERVER_PORT 80
EXPOSE 80
STOPSIGNAL SIGTERM
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]
