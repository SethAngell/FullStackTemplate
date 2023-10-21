#!/bin/bash

if ! test -f manage.py; then
  django-admin startproject base_project
fi

