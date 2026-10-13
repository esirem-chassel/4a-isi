
CREATE TABLE Accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(200) NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    phone VARCHAR(20),
    role VARCHAR(20) NOT NULL, -- Customer, Partner, Driver
    active BOOLEAN NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE Customers (
    account_id INT PRIMARY KEY,
    birth_date DATE,

    FOREIGN KEY (account_id)
        REFERENCES Accounts(id)
);

CREATE TABLE DeliveryAddresses (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    label VARCHAR(50) NOT NULL,
    street_address VARCHAR(200) NOT NULL,
    address_complement TEXT,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'France',
    is_default BOOLEAN NOT NULL DEFAULT 0,

    FOREIGN KEY (customer_id)
        REFERENCES Customers(account_id)
);

CREATE TABLE Partners (
    account_id INT PRIMARY KEY,
    company_name VARCHAR(200),

    FOREIGN KEY (account_id)
        REFERENCES Accounts(id)
);

CREATE TABLE Restaurants (
    id INT PRIMARY KEY AUTO_INCREMENT,
    partner_id INT NOT NULL UNIQUE,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    phone VARCHAR(20),
    street_address VARCHAR(200) NOT NULL,
    postal_code VARCHAR(10) NOT NULL,
    city VARCHAR(100) NOT NULL,
    country VARCHAR(100) NOT NULL DEFAULT 'France',
    active BOOLEAN NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (partner_id)
        REFERENCES Partners(account_id)
);


CREATE TABLE MenuCategories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,

    FOREIGN KEY (restaurant_id)
        REFERENCES Restaurants(id)
);

CREATE TABLE MenuItems (
    id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT NOT NULL,
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    available BOOLEAN NOT NULL DEFAULT TRUE,

    FOREIGN KEY (category_id)
        REFERENCES MenuCategories(id)
);

CREATE TABLE DeliveryDrivers (
    account_id INT PRIMARY KEY,
    employee_number CHAR(30) NOT NULL UNIQUE,
    hire_date DATE NOT NULL,
    available BOOLEAN NOT NULL DEFAULT TRUE,

    FOREIGN KEY (account_id)
        REFERENCES Accounts(id)
);

CREATE TABLE Orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    restaurant_id INT NOT NULL,
    delivery_address_id INT NOT NULL,
    driver_id INT,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(30) NOT NULL DEFAULT 'PENDING', -- PENDING, WAITING, MOVING, DONE, CANCELLED
    items_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    delivery_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    total_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    instructions TEXT,

    FOREIGN KEY (customer_id)
        REFERENCES Customers(account_id),

    FOREIGN KEY (restaurant_id)
        REFERENCES Restaurants(id),

    FOREIGN KEY (delivery_address_id)
        REFERENCES DeliveryAddresses(id),

    FOREIGN KEY (driver_id)
        REFERENCES DeliveryDrivers(account_id)
);

CREATE TABLE OrderItems (
    order_id INT NOT NULL,
    menu_item_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    item_name VARCHAR(150) NOT NULL,

    PRIMARY KEY (order_id, menu_item_id),

    FOREIGN KEY (order_id)
        REFERENCES Orders(id),

    FOREIGN KEY (menu_item_id)
        REFERENCES MenuItems(id)
);


CREATE TABLE Reviews (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT NOT NULL UNIQUE,
    rating INT NOT NULL,
    comment TEXT,
    review_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (order_id)
        REFERENCES Orders(id)
);

