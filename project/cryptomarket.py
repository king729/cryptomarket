import os
import sys
import asyncio

import ccxt.async as ccxt  # noqa: E402

okcoin = ccxt.okcoinusd({
    'apiKey' : 'cee877fc-94ea-4c9e-bd84-7fdff9d1a770',
    'secret' : 'D43A8C426064C18B75923E8123C73560',
    'verbose' : False
})

print(asyncio.get_event_loop().run_until_complete(okcoin.fetch_ticker('BTC/USD')))

print("-------------")

print(asyncio.get_event_loop().run_until_complete(okcoin.fetch_orders()))