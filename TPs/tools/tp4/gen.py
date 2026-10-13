
import sqlite3
from names import *

class Generator:
    def __init__(self):
        self.db = sqlite3.connect('out/tmp.db')
        
    def generate(self):
        # start by generating N accounts, including at least 2 customers, 2 partners, 2 drivers
        pass
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
        pass
    def generateOrder(self, customerId, restoId, driverId):
        pass


