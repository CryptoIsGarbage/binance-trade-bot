FROM python:3.9

RUN apt-get update \
    && apt-get install -y \
    sqlite3 \
    rustc \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./requirements.txt .
RUN pip install -r ./requirements.txt

COPY . .

CMD ["python", "-m", "binance_trade_bot"]
