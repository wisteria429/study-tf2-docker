FROM tensorflow/tensorflow:2.0.0a0-py3-jupyter
MAINTAINER KIYOSHI FUJINE

RUN apt-get update && apt-get install -y \
    git

RUN pip install --upgrade pip
RUN pip install jupyter_contrib_nbextensions

RUN jupyter contrib nbextension install --system

RUN mkdir -p $(jupyter --data-dir)/nbextensions

RUN git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nbextensions/vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

