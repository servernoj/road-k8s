#!/bin/bash
/opt/venv/bin/gunicorn \
--worker-class uvicorn.workers.UvicornWorker \
main:app \
--bind "0.0.0.0:${PORT:-8080}"