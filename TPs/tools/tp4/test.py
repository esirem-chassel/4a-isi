import datetime
import os
import pathlib
import sqlite3
import sys

class SQLQueryWithTiming:
    def __init__(self, query:str, timing:int, results):
        self.query = query
        self.timing = timing
        self.results = results
    def getQuery(self)->str:
        return self.query
    def getTiming(self)->int:
        return self.timing
    def getResults(self):
        return self.results
    def __str__(self)->str:
        return f"t={self.getTiming()}µs|c={len(self.getResults())}"
    def __repr__(self):
        return f"{self.__str__()}"

class SQLTester:
    def __init__(self, path:str):
        if os.path.isfile(path):
            self.db = sqlite3.connect(path)
        else:
            raise Exception(f"Unable to open `{path}` from `{pathlib.Path().resolve()}`")
        self.timer = None
    def start(self)->None:
        self.timer = datetime.datetime.now()
    def stop(self)->int:
        dt = datetime.datetime.now() - self.timer
        df = dt.total_seconds() * 1000000 + dt.microseconds
        self.timer = None
        return df
    def q(self, query:str, qargs:tuple = ()):
        self.start()
        cr = self.db.cursor()
        cr.execute(query, qargs)
        res = cr.fetchall()
        return SQLQueryWithTiming(query, self.stop(), res)

if __name__ == '__main__':
    if len(sys.argv) > 1:
        tester = SQLTester(sys.argv[1])
        r = tester.q("select substr(a.postal_code, 0, 2) as dep, count(o.id) as nb from orders o left join deliveryaddresses a on a.id=o.delivery_address_id group by dep")
        print(r)
        r = tester.q("select strftime('%Y', order_date) as y, count(id) as nb from orders group by y")
        print(r)
        r = tester.q("select case when r.city=a.city then 1 else 0 end as same_city, count(o.id) as nb from orders o left join restaurants r on r.id=o.restaurant_id left join deliveryaddresses a on a.id=o.delivery_address_id group by same_city")
        print(r)
    else:
        print("Usage : `test.py <path>` with `<path>` being the path to the SQLite database")
