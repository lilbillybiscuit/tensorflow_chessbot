# Pull the base image with python 3.7 as a runtime for your Lambda
FROM public.ecr.aws/lambda/python:3.7

# Copy the earlier created requirements.txt file to the container
COPY requirements.txt ./

# Install OS packages for Pillow-SIMD
RUN yum -y install tar wget gzip zlib freetype-devel unzip \
    gcc \
    ghostscript \
    lcms2-devel \
    libffi-devel \
    libimagequant-devel \
    libjpeg-devel \
    libraqm-devel \
    libtiff-devel \
    libwebp-devel \
    make \
    openjpeg2-devel \
    sudo \
    tcl-devel \
    tk-devel \
    tkinter \
    which \
    xorg-x11-server-Xvfb \
    zlib-devel \
    && yum clean all

# Install the python requirements from requirements.txt
RUN python3.7 -m pip install -r requirements.txt

COPY app.py ./

RUN wget https://codeload.github.com/Elucidation/tensorflow_chessbot/zip/chessfenbot
RUN unzip chessfenbot
RUN mv tensorflow_chessbot-chessfenbot/* ./
RUN rm -rf tensorflow_chessbot-chessfenbot
RUN rm chessfenbot

CMD ["app.lambda_handler"]
