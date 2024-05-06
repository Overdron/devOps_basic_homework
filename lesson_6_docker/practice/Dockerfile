FROM ubuntu:18.04

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y -q python-all python-pip                                                            
WORKDIR /tmp/                                                                                                                                               
ADD requirements.txt ./                                                                                                                                     
RUN pip install -qr requirements.txt                                                                                                                                                                                                                                                                                    
WORKDIR /opt/webapp                                                                                                                                         
ADD app.py ./                                                                                                                                               
EXPOSE 5000                                                                                                                                                 
CMD ["python", "app.py"]