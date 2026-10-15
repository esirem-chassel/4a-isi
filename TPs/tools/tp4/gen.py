
import random
import sqlite3
from names import *

class Generator:
    def __init__(self):
        self.db = sqlite3.connect('TPs/datasets/tp5.db', isolation_level=None)
    def qa(self, query:str, qargs:tuple = ()):
        cr = self.db.cursor()
        cr.execute(query, qargs)
        return cr.fetchall()
    def qo(self, query:str, qargs:tuple = ()):
        cr = self.db.cursor()
        cr.execute(query, qargs)
        return cr.fetchone()
    def generate(self):
        self.generateOrders()
    def generateAccount(self):
        pass
    def generateCustomer(self):
        pass
    def generatePartner(self):
        pass
    def generateDriver(self):
        pass
    def generateResto(self, partnerId):
        pass
    def generateAddress(self, customerId):
        pass
    def generateMenus(self, restoId):
        pass
    def generateOrders(self):
        # find random customer, resto, driver
        customers = []
        restos = []
        drivers = []
        r = self.qa("select account_id as id from customers order by random()")
        for l in r:
            customers.append(l[0])
        self.qa("select id from restaurants order by random()")
        for l in r:
            restos.append(l[0])
        self.qa("select account_id as id from deliverydrivers order by random()")
        for l in r:
            drivers.append(l[0])
        nb = 100000
        print(f"Generating {nb} orders (c={len(customers)}|r={len(restos)}|d={len(drivers)})...")
        for i in range(nb):
            self.generateOrder(random.choice(customers), random.choice(restos), random.choice(drivers))
    def generateOrder(self, customerId, restoId, driverId):
        q = "insert into orders (customer_id, restaurant_id, delivery_address_id, driver_id, order_date) " \
            " select ? , ?, id, ?, datetime('now') " \
            " from deliveryaddresses where customer_id=? "
        cr = self.db.cursor()
        cr.execute(q, (customerId, restoId, driverId, customerId))
        orderId = cr.lastrowid
        q = "insert into orderitems (order_id, menu_item_id, quantity, unit_price, item_name) " \
            " select ?, i.id, random()%10, i.price, i.name from menuitems i " \
            " left join menucategories c on c.id=i.category_id " \
            " where c.restaurant_id=? " \
            " order by random() limit 10"
        cr.execute(q, (orderId, restoId))

if __name__ == '__main__':
    Generator().generate()
