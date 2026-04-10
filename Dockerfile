ARG BASE_IMAGE=quay.io/devfile/base-developer-image
ARG BASE_IMAGE_TAG=ubi9-latest
FROM ${BASE_IMAGE}:${BASE_IMAGE_TAG}

LABEL maintainer="Jason Galens"

LABEL name="devfile/lingua-developer-image"

USER 0

ARG GCC_TOOLSET=gcc-toolset-15

RUN set -eux; \
    dnf install -y llvm-devel llvm-toolset llvm-static cmake clang clangd clang-libs clang-tools-extra clang-tools-extra-devel ccache \
                   ${GCC_TOOLSET}-libasan-devel ${GCC_TOOLSET}-libatomic-devel ${GCC_TOOLSET}-libitm-devel \
                   ${GCC_TOOLSET}-libgccjit-devel ${GCC_TOOLSET}-gcc ${GCC_TOOLSET}-gcc-c++ clang-analyzer \
                   java-21-openjdk-headless; \
    dnf clean all -y --enablerepo='*'

USER 10001

ENV HOME=/home/user
ENV PATH=${HOME}/bin:${PATH}
