FROM python as base

LABEL maintainer="Shaik Imran"
RUN git clone https://github.com/shaikimranpersistent/dummy-webapp-finadict.git
WORKDIR ./dummy-webapp-finadict
RUN pip install -r ./requirements.txt

FROM base AS app

ENV STREAMLIT_SERVER_PORT 80
EXPOSE 80
STOPSIGNAL SIGTERM
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]
