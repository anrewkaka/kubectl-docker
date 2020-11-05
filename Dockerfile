FROM ubuntu:18.04

RUN apt-get update -y && \
    apt-get install -y apt-transport-https gnupg2 curl

RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

RUN apt-get update -y && \
    apt-get install -y kubectl

RUN mkdir /.kube && \
    touch /.kube/config

RUN chown $(id -u):$(id -g) /.kube/config && \
    echo "export KUBECONFIG=/.kube/config" | tee -a $HOME/.bashrc && \
    . $HOME/.bashrc
