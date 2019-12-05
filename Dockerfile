FROM debian:10.2

RUN apt-get -y update && apt-get install -y git python3-pip python3-dev python3-tk vim procps curl libsm6

#Face classificarion dependencies & web application
RUN pip3 install numpy==1.17.4 scipy==1.3.3 scikit-learn==0.22 Pillow==6.2.1 tensorflow==1.14.0 pandas==0.25.3 h5py==2.10.0 opencv-python==3.4.2.17 Keras==2.3.1 statistics==1.0.3.5 PyYAML==5.2 pyparsing==2.4.5 cycler==0.10.0 matplotlib==3.1.2 Flask==1.1.1 imageio==2.6.1
ADD . /ekholabs/face-classifier

WORKDIR ekholabs/face-classifier

ENV PYTHONPATH=$PYTHONPATH:src
ENV FACE_CLASSIFIER_PORT=8084
EXPOSE $FACE_CLASSIFIER_PORT

ENTRYPOINT ["python3"]
CMD ["src/web/faces.py"]
