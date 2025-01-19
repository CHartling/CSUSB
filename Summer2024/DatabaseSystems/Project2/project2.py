import mysql.connector
from mysql.connector import Error

try:
    connection = mysql.connector.connect(host='localhost', database='project2', user='root', password='Dadkenmomel123!')
    if connection.is_connected():
        cursor = connection.cursor()
        
        
        # Creation of tables
        
        cursor.execute("CREATE TABLE publishers (pubID INT(5) NOT NULL, pname VARCHAR(30) NULL, email VARCHAR(30) NULL, phone VARCHAR(30), PRIMARY KEY(pubID), UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE)")
        cursor.execute("CREATE TABLE subjects (subID VARCHAR(5) NOT NULL, sName VARCHAR(30) NULL, PRIMARY KEY(subID))")
        cursor.execute("CREATE TABLE authors (auID INT(5) NOT NULL, aName VARCHAR(30) NULL, email VARCHAR(50) NULL, phone VARCHAR(30) NULL, PRIMARY KEY(auID), UNIQUE INDEX email_UNIQUE (email ASC) VISIBLE)")
        cursor.execute("CREATE TABLE titles (titleID INT(5) NOT NULL, title VARCHAR(30) NULL, pubID INT(5)NULL, subID VARCHAR(5) NULL, pubDate DATE NULL, cover VARCHAR(10) NULL, price INT(4) NULL, PRIMARY KEY(titleID), INDEX pubid_idx (pubID ASC) VISIBLE, INDEX subid_idx (subID ASC) VISIBLE, CONSTRAINT pubid FOREIGN KEY(pubID) REFERENCES publishers(pubID) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT subid FOREIGN KEY(subID) REFERENCES subjects(subID) ON DELETE NO ACTION ON UPDATE NO ACTION)")
        cursor.execute("CREATE TABLE titleauthors (titleID INT(5) NOT NULL, auID INT(5) NOT NULL, importance INT(2) NULL, PRIMARY KEY(titleID, auID), INDEX auID_idx (auID ASC) VISIBLE, CONSTRAINT titleid FOREIGN KEY (titleID) REFERENCES titles(titleID) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT auid FOREIGN KEY (auID) REFERENCES authors (auID) ON DELETE NO ACTION ON UPDATE NO ACTION)")
        
        
        # Insert into tables
        cursor.execute("INSERT INTO subjects VALUES ('ORA','ORACLE DATABASE')")
        cursor.execute("INSERT INTO subjects VALUES ('JAVA','JAVA LANGUAGE')")
        cursor.execute("INSERT INTO subjects VALUES ('JEE','JAVA ENTEPRISE EDITION')")
        cursor.execute("INSERT INTO subjects VALUES ('VB','VISUAL BASIC.NET')")
        cursor.execute("INSERT INTO subjects VALUES ('ASP','ASP.NET')")

        cursor.execute("INSERT INTO publishers VALUES (1,'WILLEY','WDT@VSNL.NET','9112326087')")
        cursor.execute("INSERT INTO publishers VALUES (2,'WROX','INFO@WROX.COM',NULL)")
        cursor.execute("INSERT INTO publishers VALUES (3,'TATA MCGRAW-HILL','FEEDBACK@TATAMCGRAWHILL.COM','9133333322')")
        cursor.execute("INSERT INTO publishers VALUES (4,'TECHMEDIA','BOOKS@TECHMEDIA.COM','9133257660')")
        
        cursor.execute("INSERT INTO authors VALUES (101, 'HERBERT SCHILD','HERBERT@YAHOO.COM', '2137823450')")
        cursor.execute("INSERT INTO authors VALUES (102, 'JAMES GOODWILL','GOODWILL@HOTMAIL.COM', '9095871243')")
        cursor.execute("INSERT INTO authors VALUES (103, 'DAVAID HUNTER','HUNTER@HOTMAIL.COM', '9094235581')")
        cursor.execute("INSERT INTO authors VALUES (104, 'STEPHEN WALTHER','WALTHER@GMAIL.COM', '2138773902')")
        cursor.execute("INSERT INTO authors VALUES (105, 'KEVIN LONEY','LONEY@ORACLE.COM', '9493423410')")
        cursor.execute("INSERT INTO authors VALUES (106, 'ED. ROMANS', 'ROMANS@THESERVERSIDE.COM', '9495012201')")
        
        cursor.execute("INSERT INTO titles VALUES (1001,'ASP.NET UNLEASHED',4,'ASP','2002-04-02','HARD COVER',540)")
        cursor.execute("INSERT INTO titles VALUES (1002,'ORACLE10G COMP. REF.',3,'ORA','2005-05-01','PAPER BACK',575)")
        cursor.execute("INSERT INTO titles VALUES (1003,'MASTERING EJB',1,'JEE','2005-02-03','PAPER BACK',475)")
        cursor.execute("INSERT INTO titles VALUES (1004,'JAVA COMP. REF',3,'JAVA','2005-04-03','PAPER BACK',499)")
        cursor.execute("INSERT INTO titles VALUES (1005,'PRO. VB.NET',2,'VB','2005-06-15','HARD COVER',450)")
        cursor.execute("INSERT INTO titles VALUES (1006,'INTRO. VB.NET',2,'VB','2002-12-02','PAPER BACK',425)")
        
        cursor.execute("INSERT INTO titleauthors VALUES (1001,104,1)")
        cursor.execute("INSERT INTO titleauthors VALUES (1002,105,1)")
        cursor.execute("INSERT INTO titleauthors VALUES (1003,106,1)")
        cursor.execute("INSERT INTO titleauthors VALUES (1004,103,1)")
        cursor.execute("INSERT INTO titleauthors VALUES (1005,103,1)")
        cursor.execute("INSERT INTO titleauthors VALUES (1005,102,2)")
        
        connection.commit()
        
        # Queries
        # Query 1
        print("Query 1: print out titles table")
        query = "SELECT * FROM titles"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        print("\n\n")
        
        # Query 2
        print("Query 2: create customer table")
        cursor.execute("CREATE TABLE customer (custID INT(5) NOT NULL, custName VARCHAR(30) NULL, zip INT(5) NULL, city VARCHAR(30) NULL, state VARCHAR(30) NULL, PRIMARY KEY(custID))")
        
        
        cursor.execute("DESCRIBE customer")
        for x in cursor:
            print(x)
        print("\n\n")
        
        # Query 3
        print("Query 3: Insert customers")
        cursor.execute("INSERT IGNORE INTO customer VALUES (1,'Abraham Silberschatz',12345,'Sacramento','California')")
        cursor.execute("INSERT IGNORE INTO customer VALUES (2,'Henry Korth',21435,'Boise','Idaho')")
        cursor.execute("INSERT IGNORE INTO customer VALUES (3,'Calvin Harris',54321,'Dallas','Texas')")
        cursor.execute("INSERT IGNORE INTO customer VALUES (4,'Martin Garrix',45231,'Las Vegas','Nevada')")
        cursor.execute("INSERT IGNORE INTO customer VALUES (5,'James Goodwill',13524,'Jackson','Wyoming')")
        
        
        query = "SELECT * FROM customer"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        
        print("\n\n")
        
        # Query 4
        print("Query 4: Find the publisher who has published the most titles")
        query = "SELECT P.pname, COUNT(T.title) FROM publishers AS P, titles AS T WHERE P.pubID=T.pubID GROUP BY pname HAVING COUNT(T.pubID) >= ALL (SELECT COUNT(title) FROM titles GROUP BY pubID)"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        print("\n\n")
        
        # Query 5
        print("Query 5: List the authors total price of their published books")
        query = "SELECT A.aName, SUM(T.price) FROM authors AS A, titles AS T, titleauthors AS AT WHERE A.auID=AT.auID AND AT.titleID=T.titleID GROUP BY A.aName ORDER BY SUM(T.price) DESC"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        print("\n\n")
        
        # Query 6
        print("Query 6: select all titles with more than 1 author")
        query = "SELECT T.title FROM titles AS T, titleauthors AS A WHERE T.titleID=A.titleID AND 1 < (SELECT COUNT(auID) FROM titleauthors WHERE titleauthors.titleID=T.titleID) GROUP BY T.title"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        print("\n\n")
        
        # Query 7
        print("Query 7: select all publishers who have published a paper back book with a price below $500")
        query = "SELECT P.pname FROM publishers AS P, titles AS T WHERE P.pubID=T.pubID AND T.price < 500 AND T.cover LIKE 'Paper%' GROUP BY P.pname"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        print("\n\n")
        
        # Query 8
        print("Query 8: select all authors who have written about 'JAVA' but not 'VISUAL BASIC.NET'")
        query = "SELECT A.aName FROM authors AS A, titles AS T, titleauthors AS AT, subjects AS S WHERE A.auID=AT.auID AND AT.titleID=T.titleID AND T.subID=S.subID AND S.sName LIKE '%JAVA%' AND S.sName NOT LIKE '%VISUAL BASIC.NET%' GROUP BY A.aName"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        print("\n\n")
        
        # Query 9
        print("Query 9: select all names of publishers whose email is a .com")
        query = "SELECT pname FROM publishers WHERE email LIKE '%.COM'"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        print("\n\n")
        
        # Query 10
        print("Query 10: decrease the price of all books published before 2003 by 5% and increase all after 2004 by 15%")
        query = "SELECT * FROM titles"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        
        query = "UPDATE titles SET price=(price * 0.95) WHERE pubDate < '2003-01-01'"
        cursor.execute(query)
        query = "UPDATE titles SET price=(price * 1.15) WHERE pubDate > '2004-12-31'"
        cursor.execute(query)
        connection.commit()
        
        print("\n")
        query = "SELECT * FROM titles"
        cursor.execute(query)
        for row in cursor.fetchall():
            print(row)
        print("\n\n")
        

except Error as e:
    print("Error while connecting to MySQL", e)
finally:
    if connection.is_connected():
        cursor.close()
        connection.close()
        print("MySQL connection is closed")