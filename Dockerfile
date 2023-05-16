FROM subhayu99/fbprophet AS base

LABEL maintainer="Shaik Imran"
RUN sudo apt update
RUN sudo apt upgrade -y

FROM base AS middle

RUN git clone https://github.com/shaikimranpersistent/dummy-webapp-finadict.git
WORKDIR /root/notebooks/finadict
RUN pip3 install -r requirements.txt

FROM middle AS app

ENV STREAMLIT_SERVER_PORT 80
EXPOSE 80
STOPSIGNAL SIGTERM
ENTRYPOINT ["streamlit", "run"]
CMD ["app.py"]
