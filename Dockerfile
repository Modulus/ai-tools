FROM python

RUN pip install goldenverba

EXPOSE 8080


CMD [ "verba/start" ]