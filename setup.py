#!/usr/bin/env python

from setuptools import setup

setup(
    name="yatank-graphite",
    version="0.0.0.1",
    description="Yandex.Tank Graphite plugin",
    author="Ilya Krylov",
    author_email="ilya.krylov@gmail.com",
    url="http://github.com/sputnik-load/yatank-graphite",
    packages=["yatank_Graphite"],
    package_data={"yatank_Graphite": ["config/*"]},
    package_dir={"yatank_Graphite": "yatank_Graphite"},
    install_requires=[
    ],
)
